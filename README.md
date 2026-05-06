# beacon-rel-budget-dock

`beacon-rel-budget-dock` keeps a focused Solidity implementation around reliability. The project goal is to develop a Solidity command-oriented project for budget scenarios with seeded input scenarios, deterministic summary checks, and single-node deterministic mode.

## Use Case

The point is to make a small domain rule concrete enough that a reader can change it and immediately see what broke.

## Beacon Rel Budget Dock Review Notes

For a quick review, compare `failure width` with `runbook drift` before reading the middle cases.

## Highlights

- `fixtures/domain_review.csv` adds cases for budget pressure and failure width.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/beacon-rel-budget-walkthrough.md` walks through the case spread.
- The Solidity code includes a review path for `failure width` and `runbook drift`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Code Layout

The fixture data drives the tests. The code stays thin, while `metadata/domain-review.json` and `config/review-profile.json` explain what each case is meant to protect.

The Solidity checks add a pure review lens and Foundry coverage.

## Run The Check

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Regression Path

The same command runs the local verification path. The highest-scoring domain case is `stress` at 228, which lands in `ship`. The most cautious case is `recovery` at 131, which lands in `watch`.

## Future Work

This remains a local project with deterministic fixtures. It does not depend on credentials, hosted services, or live data. Future work should add richer malformed inputs before widening the public API.
