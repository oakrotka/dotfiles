return {
  {
    -- verbose indents
    'lukas-reineke/indent-blankline.nvim',
    version = '*',
    event = 'VeryLazy',
    main = 'ibl',
    opts = {},
  },

  {
    -- pretty line at the bottom
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {},
  },

  {
    -- prettier colorcolumn to show suggested text width
    'lukas-reineke/virt-column.nvim',
    version = '*',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'rcarriga/nvim-notify',
    version = '*',
    lazy = false,
    config = function ()
      vim.notify = require('notify')
    end
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {},
  },
}
