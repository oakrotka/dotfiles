vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local util = require "util"
local map = vim.keymap.set

map('n', '<ESC>', '<cmd>nohlsearch<cr>')

--- navigating the terminal ---
map('n', '<leader>v', util.open_terminal_split)  -- open a configured terminal to the right
map('t', '<C-[>', '<C-\\><C-n>')                 -- exit terminal
map('t', '<C-w>', '<C-\\><C-n><C-w>')            -- change nvim window
-- <C-d> to exit (I'm writing this down here so I won't forget it and make a redundant keymap)
