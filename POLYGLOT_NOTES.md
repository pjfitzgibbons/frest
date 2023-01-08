# POLYGLOT Notes
Thoughts and issues found while attempting to implement Frest w/ various alternate languages/compilers

## Ruby (3.1)
Although supporting type checking (non-runtime), types are specified in an "outside" file.  The enforced file path is entirely external to the code-tree.   Solutions to "inline" typing (Sorbet) do not support needed typing paradigms (Union) in an elegant way.

## Crystal Lang (1.6)
Crystal support in IDE's is weak.   Intellij - Crystal plugin does not support running spec files (Crystal cmd `crystal spec`).  As of Jan 2023 PJF could not find a way to dynamically configure a Script run-confirugration that would allow running arbitrary files (ie. _spec.cr).
VSCode - In a sort of inverse of Intellij, VSCode has ok formatting and run configurations --- and cannot go-to-definition nor do proper refactor/renaming.

## Python (3.11)
-- WIP
