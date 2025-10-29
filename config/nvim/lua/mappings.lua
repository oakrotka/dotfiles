local util = require "util"
local map = vim.keymap.set

map('n', '<ESC>', '<cmd>nohlsearch<cr>')

--- navigating the terminal ---
map('n', '<leader>v', util.open_terminal_split)
map('t', '<C-[>', '<C-\\><C-n>')
map('t', '<C-w>', '<C-\\><C-n><C-w>')
-- <C-d> to exit (I'm writing this down here so I won't forget it and make a redundant keymap)
