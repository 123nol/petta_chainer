from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class BudgetEstimate:
    pq_steps: int
    pln_maxsteps: int
    task_queue: int
    belief_queue: int


def _tree_nodes(depth: int, width: int) -> int:
    if depth <= 0:
        return 1
    width = max(1, width)
    if width == 1:
        return depth + 1
    total = 0
    for level in range(depth + 1):
        total += width**level
    return total


def estimate_budget(
    depth: int,
    width: int,
    noise: int,
    paths: int,
    calibration: float = 1.0,
) -> BudgetEstimate:
    depth = max(1, depth)
    width = max(1, width)
    noise = max(0, noise)
    paths = max(1, paths)
    scale = max(0.25, calibration)

    nodes = _tree_nodes(depth, width)
    structural_cost = 22 * depth + 7 * width + 4 * nodes
    noise_cost = 26 * noise
    path_cost = 34 * paths

    raw_steps = int((120 + structural_cost + noise_cost + path_cost) * scale)
    pq_steps = max(120, raw_steps)
    pln_maxsteps = max(160, int(pq_steps * 1.2))
    task_queue = max(2000, int((pln_maxsteps + 8 * noise + 10 * paths) * 16))
    belief_queue = max(2000, int((pln_maxsteps + 6 * noise + 10 * paths) * 16))

    return BudgetEstimate(
        pq_steps=pq_steps,
        pln_maxsteps=pln_maxsteps,
        task_queue=task_queue,
        belief_queue=belief_queue,
    )
