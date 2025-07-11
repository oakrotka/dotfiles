vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true

-- switch back to the beam cursor after shutdown
-- in the future, maybe figure out a way to autodetect the terminal's
-- default cursor style? not sure if it's possible though
vim.cmd("au VimLeave * set guicursor=a:ver1-blinkon1")
