-- leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- misc editor functionality
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.mouse = 'a'                 -- allow the mouse to be used
vim.opt.undofile = true             -- persistent undo history among session

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- I will probably want to switch from spaces to tabs someday
vim.opt.expandtab = true

-- columns
vim.opt.number = true               -- show the number column
vim.opt.relativenumber = true       -- show relative numbers in all columns but the current
vim.opt.numberwidth = 2             -- lesser indent of the current line indicator
vim.opt.cursorline = true           -- highlight the current line number
vim.opt.cursorlineopt = 'number'
vim.opt.signcolumn = 'yes'          -- make space for diagnostics to the left of line numbers
vim.opt.colorcolumn = '101'         -- show code limit of 100 columns

-- ui
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.laststatus = 3              -- only show one status line

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- whitespace presentation
vim.opt.list = true
vim.opt.listchars = 'trail:•'  -- TODO visible tabs
