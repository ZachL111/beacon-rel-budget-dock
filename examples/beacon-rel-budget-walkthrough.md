# Beacon Rel Budget Dock Walkthrough

I use this file as a small checklist before changing the Solidity implementation.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | budget pressure | 197 | ship |
| stress | failure width | 228 | ship |
| edge | recovery gap | 135 | watch |
| recovery | runbook drift | 131 | watch |
| stale | budget pressure | 198 | ship |

Start with `stress` and `recovery`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

The next useful expansion would be a malformed fixture around failure width and runbook drift.
