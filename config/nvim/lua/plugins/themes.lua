-- themes
return {
  {
    -- TODO: this plugin's defaults are lame, change them to match nvchad's base46 plugin
    -- or change to the base46 plugin enitrely (if it's possible without forcing the directory
    -- structure to rely on nvchad's)
    'catppuccin/nvim',
    name = 'catppuccin',
    version = '*',

    -- this is the main theme
    lazy = false,
    priority = 1000,

    init = function()
      vim.cmd.colorscheme('catppuccin')
    end,

    opts = {
      flavour = 'mocha',

      auto_integrations = true,
      integrations = {
        barbar = false,  -- it's SO ugly
      },

      custom_highlights = function(colors)
        return {
          WinSeparator = { fg = colors.overlay0 },
        }
      end,
    },
  },

  {
    'maxmx03/fluoromachine.nvim',
    name = 'fluoromachine',
    event = 'VeryLazy',
    priority = 0,

    opts = {
      theme = 'fluoromachine',
    }
  },
}
