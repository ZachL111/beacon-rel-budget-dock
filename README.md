# beacon-rel-budget-dock

`beacon-rel-budget-dock` explores reliability in Solidity. The repository keeps the core rule set compact, then surrounds it with examples that show how the decisions move.

## Beacon Rel Budget Dock Notes

The quickest review path is the verifier first, then the fixtures, then the operations note. That order makes it easy to see whether the code, data, and explanation still agree.

## Why This Exists

This is not a wrapper around a service. It is a self-contained project that shows how the model behaves when demand, capacity, latency, risk, and weight move in different directions.

## Example Scenarios

The extended cases are not random smoke tests. `degraded` keeps pressure on the review path, while `surge` shows the model when capacity and weight are strong enough to clear the threshold.

## Implementation Notes

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps failure windows, retry budgets, and runbook checks in one explicit decision path. The threshold is 184, with risk penalty 5, latency penalty 2, and weight bonus 2. The Solidity project uses Foundry tests and pure contract functions so invariants are cheap to exercise.

## Feature Notes

- Models failure windows with deterministic scoring and explicit review decisions.
- Uses fixture data to keep retry budgets changes visible in code review.
- Includes extended examples for runbook checks, including `surge` and `degraded`.
- Documents recovery paths tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## Try It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Tests

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Code Tour

- `src`: primary implementation
- `test`: language test directory
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands
- `foundry.toml`: Foundry project configuration

## Roadmap

- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Add one more reliability fixture that focuses on a malformed or borderline input.

## Boundaries

The examples cover useful edges, not every edge. A larger version would add malformed-input tests, richer reports, and deeper domain parsers.

## Local Setup

Use a normal shell with Solidity available on `PATH`. The verifier is written as a PowerShell script because the portfolio was assembled on Windows.
