-- themes
return {
  {
    -- TODO: this plugin's defaults are lame, change them to match nvchad's base46 plugin
    -- or change to the base46 plugin enitrely (if it's possible without forcing the directory
    -- structure to rely on nvchad's)
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
