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
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      auto_hide = 1,
      minimum_padding = 0,
    },
    -- TODO keymaps
  },

  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
    -- this plugin advises against lazy loading, so disable it if anything goes wrong
    keys = {
	    { '<C-n>', '<cmd>NvimTreeToggle<cr>', desc = 'Filesystem tree' },
    }
  },
}
