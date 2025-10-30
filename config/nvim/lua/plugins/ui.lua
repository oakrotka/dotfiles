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
}
