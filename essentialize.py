import json

LEAN_TO_PETTA = {
    "Lean.Constant.And": "∧",
    "Lean.Constant.Or": "∨",
    "Lean.Constant.Not": "¬",
    "Lean.Constant.Implies": "→",
    "And": "∧",
    "Or": "∨",
    "Not": "¬",
    "Implies": "→",
    "Lean.Constant.Iff": "↔",
    "Lean.Constant.False": "false",
    "Lean.Constant.True": "true",
    "Lean.Constant.Eq": "=",
    "Lean.Constant.Ne": "≠",
    "Lean.Constant.Exists": "∃",
    "Lean.Constant.Forall": "∀",
}

METAMATH_VAR_CYCLE = [
    "$phi", "$psi", "$chi", "$theta", "$tau", "$eta", "$omega",
    "$alpha", "$beta", "$gamma", "$delta", "$epsilon", "$zeta", "$lambda",
]

class VariableNormalizer:
    """
    Handles variable normalization by cycling through Metamath-style
    variable names: $phi, $psi, $chi, $theta, etc.
    """
    def __init__(self):
        self.var_map = {}
        self.counter = 0

    def get_normalized(self, var_id):
        if var_id not in self.var_map:
            var_name = METAMATH_VAR_CYCLE[self.counter % len(METAMATH_VAR_CYCLE)]
            self.var_map[var_id] = var_name
            self.counter += 1
        return self.var_map[var_id]

def flatten_app(node):
    """
    Lean applications are nested (binary). 
    This flattens (f a b) represented as App(App(f, a), b) into [f, a, b].
    """
    args = []
    curr = node
    while isinstance(curr, dict) and curr.get("kind") == "app":
        args.append(curr.get("arg"))
        curr = curr.get("fn")
    args.append(curr)
    args.reverse()
    return args

def translate_to_sexpr_obj(node, normalizer):
    """
    Recursively transforms a Pantograph JSON AST node into a nested list structure
    representing an S-expression using Metamath-compatible symbols and variables.
    """
    if not isinstance(node, dict):
        return str(node)

    kind = node.get("kind")

    if kind == "const":
        name = node.get("name", "")
        mapped = LEAN_TO_PETTA.get(name, name.split('.')[-1].lower())
        return mapped

    elif kind == "fvar":
        var_id = node.get("id", node.get("userName", "unknown"))
        return normalizer.get_normalized(var_id)

    elif kind == "bvar":
        return f"$b{node.get('index', 0)}"

    elif kind == "app":
        flat = flatten_app(node)
        return [translate_to_sexpr_obj(arg, normalizer) for arg in flat]

    elif kind == "lam" or kind == "forallE":
        label = "λ" if kind == "lam" else "∀"
        var_name = node.get("name", "x")
        norm_name = normalizer.get_normalized(var_name)
        v_type = translate_to_sexpr_obj(node.get("type"), normalizer)
        body = translate_to_sexpr_obj(node.get("body"), normalizer)
        return [label, [norm_name, v_type], body]

    elif kind == "lit":
        return str(node.get("value"))

    return str(node)

def format_sexpr(obj):
    """
    Converts the nested list structure into a standard S-expression string.
    """
    if isinstance(obj, list):
        return "(" + " ".join(format_sexpr(x) for x in obj) + ")"
    return str(obj)

def essentialize(ast_json):
    """
    Translates a raw Lean expression JSON into an S-expression string.
    """
    normalizer = VariableNormalizer()
    sexpr_obj = translate_to_sexpr_obj(ast_json, normalizer)
    return format_sexpr(sexpr_obj)

import re

def parse_sexp_string(s):
    """
    Parses a Pantograph S-expression string into a nested list structure.
    Example: '(:forall q (:sort 0) body)' -> [':forall', 'q', [':sort', '0'], 'body']
    """
    tokens = re.findall(r'\(|\)|:[^\s()]+|[^\s()]+', s)
    def read_tokens(tokens):
        if not tokens: return None
        token = tokens.pop(0)
        if token == '(':
            L = []
            while tokens[0] != ')':
                L.append(read_tokens(tokens))
            tokens.pop(0) 
            return L
        return token
    return read_tokens(tokens)

def translate_sexp_obj(node, normalizer, context=None):
    """
    Translates a parsed Pantograph sexp node into a Metamath-compatible s-expression.
    Handles de Bruijn indices and symbol mapping.
    """
    if context is None: context = []
    
    if isinstance(node, list):
        if not node: return "()"
        head = node[0]
        if isinstance(head, str) and (head == ":forall" or head == ":lambda"):
            name = node[1]
            clean_name = normalizer.get_normalized(name)
            type_sexpr = translate_sexp_obj(node[2], normalizer, context)
         
            new_context = [clean_name] + context
            body_sexpr = translate_sexp_obj(node[3], normalizer, new_context)
            
            label = "∀" if head == ":forall" else "λ"
            return [label, [clean_name, type_sexpr], body_sexpr]
            
        if head == ":c":
            const_name = node[1]
            mapped = LEAN_TO_PETTA.get(const_name, const_name.lower())
            return mapped
            
        if head == ":fv":
            return normalizer.get_normalized(node[1])
            
        if head == ":sort":
            return "sort" if node[1] == "0" else f"type{node[1]}"

        if isinstance(head, str) and head.startswith(":"):
            return translate_sexp_obj(node[1], normalizer, context)

        return [translate_sexp_obj(item, normalizer, context) for item in node]

    if isinstance(node, str) and node.isdigit():
        idx = int(node)
        if idx < len(context):
            return context[idx]
        return f"$b{idx}"

    return str(node)

def essentialize_subgoal(subgoal_json):
    """
    Translates a Pantograph goal/subgoal into a Metamath-compatible turnstile query.
    Handles the 'sexp' field (even if nested inside target).
    """
    normalizer = VariableNormalizer()
    
    hyps = []
    vars_list = subgoal_json.get("vars") or subgoal_json.get("variables") or []
    for v in vars_list:
        v_name_raw = v.get("name") or v.get("userName") or "v"
        v_name = normalizer.get_normalized(v_name_raw)
        
        v_type_raw = v.get("type") or v.get("t")
        if isinstance(v_type_raw, dict) and "sexp" in v_type_raw:
             parsed_t = parse_sexp_string(v_type_raw["sexp"])
             v_type = translate_sexp_obj(parsed_t, normalizer)
        else:
             v_type = translate_to_sexpr_obj(v_type_raw, normalizer)
        hyps.append([v_name, v_type])
    
    for h in subgoal_json.get("hypotheses", []):
        h_name_raw = h.get("userName") or h.get("name") or "h"
        h_name = normalizer.get_normalized(h_name_raw)
        h_type = translate_to_sexpr_obj(h.get("type"), normalizer)
        hyps.append([h_name, h_type])
    
    target = subgoal_json.get("target") or subgoal_json.get("goal") or {}
    sexp_str = subgoal_json.get("sexp")
    if not sexp_str and isinstance(target, dict):
        sexp_str = target.get("sexp")
    
    if sexp_str:
        parsed = parse_sexp_string(sexp_str)
        goal = translate_sexp_obj(parsed, normalizer)
    else:
        goal = translate_to_sexpr_obj(target, normalizer)
    
    query_obj = ["|-", ["hyps"] + hyps, goal]
    return format_sexpr(query_obj)

