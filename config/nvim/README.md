# neovim configuration
**Work In Progress!!**

As of writing this, I am currently using a messy NvChad config.
This is my attempt to obtain a configuration where I actually know
what features do I have and what is going on under the hood.
I will delete this paragraph when this config will become usable enough
for me to switch to it (if I'll remember to).

## dependencies
external dependencies of this config (idk the minimum versions):
- terminal using a nerd font
- `yarn` (to build markdown-preview, it's possible to download a binary release instead)
- `tinymist` in `/usr/bin`, for typst-preview
- `websocat` in `/usr/bin`, for typst-preview
- I think nvim-treesitter requires `tree-sitter` CLI, as well as some shit everyone has
- language servers specified in the [lsp.lua file](./lua/lsp.lua)

## roadmap
features that are stopping me from using this config (may be incomplete):
- [x] LSP config
- [x] treesitter
- [x] autocompletion
- [ ] neovim parameters
  - [ ] tab spacing
  - [x] usage of global clipboard buffer
- [x] install the catppuccin theme
  - [ ] adjust the catppuccin theme to resemble the nvchad one more
- [x] [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [x] [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [ ] configure built-in terminals
- [x] configure file buffers/tabs
- [x] autopairs
- [ ] [pretty bottom line](https://github.com/nvim-lualine/lualine.nvim)
- [x] [pretty indents](https://github.com/lukas-reineke/indent-blankline.nvim)
- [ ] inline diagnostics (I'll probably either want 
[this plugin](https://github.com/rachartier/tiny-inline-diagnostic.nvim) 
or [that one](https://github.com/folke/trouble.nvim))
- [x] DO NOT add that stupid mason plugin

features that are not stopping me from using this config but I want to add them
- [x] hex code colors preview
- [x] typst preview
- [x] markdown preview
- [ ] smart bracket surrounding
- [ ] visible whitespace
- [ ] nice ui for notifications
- [ ] [discord presence](https://github.com/vyfor/cord.nvim) but minimal and only show filetypes
- [ ] [git stuff](https://github.com/lewis6991/gitsigns.nvim)
- [ ] [formatter](https://github.com/stevearc/conform.nvim)
- [ ] visible limit of characters in a line 
(see [this plugin](https://github.com/lukas-reineke/virt-column.nvim))
- [ ] bracket pair coloring
- [ ] maybe a pretty dashboard
- [ ] maybe make blink.cmp prettier
- [ ] maybe a cool colorscheme picker
- [ ] maybe [which-key](https://github.com/folke/which-key.nvim)
- [ ] consider using [endwise](https://github.com/RRethy/nvim-treesitter-endwise)
- [ ] snippets? idk if I need those
