return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
    -- TODO key mappings and lazy loading
  },

  {
    'romgrk/barbar.nvim',
    version = '*',
    -- I *could* technically set up an event that triggers the first time more than 2 buffers are
    -- opened, but is it worth it? hmm
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function() vim.g.barbar_auto_setup = false end,

    opts = {
      auto_hide = 1,
      minimum_padding = 0,
      maximum_padding = 3,
    },
    keys = {
      { '<A-,>',   '<cmd>BufferPrevious<cr>',     desc = 'Previous buffer' },
      { '<A-.>',   '<cmd>BufferNext<cr>',         desc = 'Next buffer' },
      { '<A-s-,>', '<cmd>BufferMovePrevious<cr>', desc = 'Move buffer back' },
      { '<A-s-.>', '<cmd>BufferMoveNext<cr>',     desc = 'Move buffer forward' },
      { '<A-x>',   '<cmd>BufferClose<cr>',        desc = 'Close current buffer' },
      { '<A-s-x>', '<cmd>BufferRestore<cr>',      desc = 'Restore buffer' },
      { '<A-p>',   '<cmd>BufferPick<cr>',         desc = 'Pick buffer' },
      { '<A-d>',   '<cmd>BufferPickDelete<cr>',   desc = 'Close picked buffer' },
    },
  },

  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
    -- this plugin advises against lazy loading, so disable it if anything goes wrong
    keys = {
      { '<C-n>', '<cmd>NvimTreeToggle<cr>', desc = 'File tree' },
    }
  },
}
