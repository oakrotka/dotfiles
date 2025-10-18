vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.list = true
vim.opt.listchars = "trail:•"  -- TODO visible tabs

-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- switch back to the beam cursor after shutdown
-- in the future, maybe figure out a way to autodetect the terminal's
-- default cursor style? not sure if it's possible though
vim.cmd("au VimLeave * set guicursor=a:ver1-blinkon1")
