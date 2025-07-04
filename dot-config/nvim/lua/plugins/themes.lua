-- themes
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',

    -- this is the main theme
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,

    opts = {
      flavour = 'mocha',
    }
  },

  {
    'maxmx03/fluoromachine.nvim',
    name = 'fluoromachine',
    lazy = true,

    opts = {
      theme = 'fluoromachine',
    }
  },
}
