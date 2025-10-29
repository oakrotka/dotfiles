-- themes
return {
  {
    'EdenEast/nightfox.nvim',
    version = '*',

    -- main theme for now
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('nightfox')
    end,

    opts = {
      groups = {
        all = {
          WinSeparator = { fg = 'palette.bg4' }
        },
      },
    },
  },

  {
    -- this plugin's defaults are lame, change them to match nvchad's base46 plugin
    -- or change to the base46 plugin enitrely (if it's possible without forcing the directory
    -- structure to rely on nvchad's)
    'catppuccin/nvim',
    name = 'catppuccin',
    version = '*',
    event = 'VeryLazy',
    priority = 0,

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
    event = 'VeryLazy',
    priority = 0,

    opts = {
      theme = 'fluoromachine',
    }
  },

  {
    'RRethy/base16-nvim',
    -- tommorow night theme is really pretty but the plugin pollutes the colorscheme list too much
    enabled = false,
    event = 'VeryLazy',
    priority = 0,
  },
}
