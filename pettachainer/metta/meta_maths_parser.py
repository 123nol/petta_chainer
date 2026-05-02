def parse_sexp(s):
    """A lightweight parser to convert Lisp-like strings into nested Python lists."""
    # Add spaces around parentheses to make tokenization easy
    s = s.replace('(', ' ( ').replace(')', ' ) ')
    tokens = s.split()
    
    def read_from_tokens(tokens):
        if not tokens:
            raise SyntaxError('Unexpected EOF')
        token = tokens.pop(0)
        if token == '(':
            L = []
            while tokens[0] != ')':
                L.append(read_from_tokens(tokens))
            tokens.pop(0) # pop off ')'
            return L
        elif token == ')':
            raise SyntaxError('Unexpected )')
        else:
            return token
            
    return read_from_tokens(tokens)

def to_lisp_str(expr):
    """Converts a nested Python list back into a Lisp string."""
    if isinstance(expr, list):
        return "(" + " ".join(to_lisp_str(x) for x in expr) + ")"
    else:
        return str(expr)

def replace_vars(expr):
    """Recursively replaces Metamath Greek letters with PeTTa variables."""
    greek_map = {
        '𝜑': '$phi',     # phi
        '𝜓': '$psi',     # psi
        '𝜒': '$chi',     # chi
        '𝜃': '$theta',   # theta
        '𝜏': '$tau',     # tau
        '𝜂': '$eta',     # eta (likely the one from your ax-tr rule)
        '𝜆': '$lambda',  
        '𝜁': '$zeta',    # zeta
        '𝜎': '$sigma',   # sigma
        '𝜇': '$mu',      # mu
        '𝛾': '$gamma',   # gamma
        '𝜌': '$rho'      # rho
    }
    
    if isinstance(expr, list):
        return [replace_vars(x) for x in expr]
    else:
        return greek_map.get(expr, expr)

def convert_metamath_to_petta(metamath_str):
    """Main parsing and formatting function."""
    parsed = parse_sexp(metamath_str)
    
    # Extract the (MkTheorem ...) block
    if parsed[0] == 'MkIndexed':
        mk_theorem = parsed[2]
    elif parsed[0] == 'MkTheorem':
        mk_theorem = parsed
    else:
        raise ValueError("String does not contain a recognizable MkTheorem block.")
        
    name = mk_theorem[1]
    proof_lambda = mk_theorem[2]
    proposition = mk_theorem[3]
    
    # Apply variable mapping
    proposition = replace_vars(proposition)
    proof_lambda = replace_vars(proof_lambda)
    
    proof_str = to_lisp_str(proof_lambda)
    
    # Separate premises and conclusion based on the '->' symbol
    if isinstance(proposition, list) and proposition[0] == '->':
        premises_raw = proposition[1:-1]
        conclusion_raw = proposition[-1]
        premises = [f"(Provable {to_lisp_str(p)})" for p in premises_raw]
        conclusion = f"(Provable {to_lisp_str(conclusion_raw)})"
    else:
        # It's an absolute theorem (like 'id'), no '->' sequence.
        # Apply the MathAxiomBase workaround.
        premises = ["(MathAxiomBase)"]
        conclusion = f"(Provable {to_lisp_str(proposition)})"
        
    premises_str = "\n            ".join(premises)
    
    # Format the final output block
    result = f"""(: ({name} {proof_str}) 
      (Implication 
         (Premises 
            {premises_str}
         ) 
         (Conclusions 
            {conclusion}
         )
      ) 
      (STV 1.0 1.0)
   )"""
    
    return result

# --- TEST EXAMPLES ---

theorems = [
    # Theorem with premises
    "(MkIndexed 6 (MkTheorem mp2 (λ mp2.1 mp2.2 mp2.3 (ax-mp mp2.2 (ax-mp mp2.1 mp2.3))) (-> 𝜑 𝜓 (→ 𝜑 (→ 𝜓 𝜒)) 𝜒)))",
    
    # Theorem with premises (nested target)
    "(MkIndexed 9 (MkTheorem 2a1i (λ 2a1i.1 (a1i (a1i 2a1i.1))) (-> 𝜑 (→ 𝜓 (→ 𝜒 𝜑)))))",
    
    # Absolute theorem with no premises
    "(MkIndexed 19 (MkTheorem id (mpd ax-1 ax-1) (→ 𝜑 𝜑)))"
]

for thm in theorems:
    print(convert_metamath_to_petta(thm))
    print("\n" + "="*50 + "\n")