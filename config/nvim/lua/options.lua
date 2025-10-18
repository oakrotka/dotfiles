-- because nvim-tree has a skill issue
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- clipboard
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.mouse = 'a'                 -- allow the mouse to be used in Nvim

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- I will probably want from spaces to switch to tabs someday
vim.opt.expandtab = true

-- ui
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '101'
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- whitespace presentation
vim.opt.list = true
vim.opt.listchars = "trail:•"  -- TODO visible tabs

-- switch back to the beam cursor after shutdown.
-- in the future, maybe figure out a way to autodetect the terminal's
-- default cursor style? not sure if it's possible though
vim.cmd("au VimLeave * set guicursor=a:ver1-blinkon1")
