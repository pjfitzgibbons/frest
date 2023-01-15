# POLYGLOT Notes
Thoughts and issues found while attempting to implement Frest w/ various alternate languages/compilers

## Ruby (3.1)
Although supporting type checking (non-runtime), types are specified in an "outside" file.  The enforced file path is entirely external to the code-tree.   Solutions to "inline" typing (Sorbet) do not support needed typing paradigms (Union) in an elegant way.

## Crystal Lang (1.6)
Crystal support in IDE's is weak.   Intellij - Crystal plugin does not support running spec files (Crystal cmd `crystal spec`).  As of Jan 2023 PJF could not find a way to dynamically configure a Script run-confirugration that would allow running arbitrary files (ie. _spec.cr).
VSCode 
- In a sort of inverse of Intellij, VSCode has ok formatting and run configurations --- and cannot go-to-definition nor do proper refactor/renaming.
- Scry LSP code server - fails to compile :
```
lsp: checking...
json_mapping: checking...
Dependencies are satisfied
Building: scry
crystal build -o /Users/pjfitz/IdeaProjects/crystal/scry/bin/scry src/scry.cr --verbose --release
Error target scry failed to compile:

In src/scry.cr:1:1
In /usr/local/Cellar/crystal/1.7.0/share/crystal/src/prelude.cr:40:1
In /usr/local/Cellar/crystal/1.7.0/share/crystal/src/crystal/main.cr:126:1
In /usr/local/Cellar/crystal/1.7.0/share/crystal/src/crystal/main.cr:127:11
In /usr/local/Cellar/crystal/1.7.0/share/crystal/src/crystal/main.cr:100:5
In /usr/local/Cellar/crystal/1.7.0/share/crystal/src/crystal/main.cr:45:18

 45 | exit(status, ex)
                   ^-
Error: expected argument #2 to 'Crystal.exit' to be (Crystal::Exception | Nil), not (Exception | Nil)

Overloads are:
 - Crystal.exit(status : Int32, exception : Exception | ::Nil)
 ```

## Python (3.11)
-- WIP
