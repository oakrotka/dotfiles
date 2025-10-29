# neovim configuration

## dependencies
external dependencies of this config (idk the minimum versions):
- terminal using a nerd font
- `yarn` (to build markdown-preview, it's possible to download a binary release instead)
- `tinymist` in `/usr/bin`, for typst-preview
- `websocat` in `/usr/bin`, for typst-preview
- I think nvim-treesitter requires `tree-sitter` CLI, as well as some shit everyone has
- language servers specified in the [lsp.lua file](./lua/lsp.lua)

## roadmap
- [x] LSP config
- [x] treesitter
- [x] autocompletion
- [ ] neovim parameters
  - [ ] tab spacing
  - [x] usage of global clipboard buffer
  - [x] make the current line number 1 column less indented to the left (and maybe brighter?)
- [x] install the catppuccin theme
  - [ ] adjust the catppuccin theme to resemble the nvchad one more
- [x] [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [x] [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [x] configure built-in terminals
  - [ ] polish the configuration
- [x] configure file buffers/tabs
- [x] autopairs
- [ ] [pretty bottom line](https://github.com/nvim-lualine/lualine.nvim)
- [x] [pretty indents](https://github.com/lukas-reineke/indent-blankline.nvim)
- [x] inline diagnostics 
  - [ ] prettier signs for diagnostics on the left
- [x] DO NOT add that stupid mason plugin
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
- [ ] check out [trouble.nvim](https://github.com/folke/trouble.nvim)
- [ ] snippets? idk if I need those
