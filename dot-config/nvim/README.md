**Work In Progress!!**

As of writing this, I am currently using a messy NvChad config.
This is my attempt to obtain a configuration where I actually know
what features do I have and what is going on under the hood.
I will delete this paragraph when this config will become usable enough
for me to switch to it (if I'll remember to).

external dependencies of this config (idk the minimum versions):
- `yarn` (to build markdown-preview, it's possible to download a binary release instead)
- `tinymist` in `/usr/bin`, for typst-preview
- `websocat` in `/usr/bin`, for typst-preview
- I think nvim-treesitter requires `tree-sitter` CLI, as well as some shit everyone has
- language servers specified in the [lsp.lua file](./lua/lsp.lua)
