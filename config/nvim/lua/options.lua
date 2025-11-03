local opt = vim.opt

-- misc editor functionality
opt.clipboard = 'unnamedplus'   -- use system clipboard
opt.mouse = 'a'                 -- allow the mouse to be used
opt.undofile = true             -- persistent undo history between sessions

-- tabs
opt.tabstop = 2
opt.shiftwidth = 0
-- I will probably want to switch from spaces to tabs someday
opt.expandtab = true

-- columns
opt.number = true               -- show the number column
opt.relativenumber = true       -- show relative numbers in all columns but the current
opt.numberwidth = 2             -- lesser indent of the current line indicator
opt.cursorline = true           -- highlight the current line number
opt.cursorlineopt = 'number'
opt.signcolumn = 'yes'          -- make space for diagnostics to the left of line numbers
opt.colorcolumn = '101'         -- show code limit of 100 columns

-- ui
opt.splitbelow = true           -- open new vertical split bottom
opt.splitright = true           -- open new horizontal splits right
opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
opt.laststatus = 3              -- only show one status line

-- searching
opt.ignorecase = true
opt.smartcase = true

-- whitespace presentation
opt.list = true
opt.listchars = 'trail:•'  -- TODO visible tabs
