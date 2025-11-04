-- miscellaneous plugins
return {
  {
    -- dependency of other plugins
    'nvim-lua/plenary.nvim',
    lazy = true,
    -- TODO switch to stable version if this plugin ever starts tagging up-to-date releases
  },

  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    version = '*',
    opts = {},
  },

  {
    -- show hex colors in files (e.g. #b852dd)
    'catgoose/nvim-colorizer.lua',
    version = '*',
    lazy = false,
    opts = {
      user_default_options = {
        RGB = false,
        RGBA = false,
        -- do not show colors for color names
        names = false,
        -- show color as a rectangle before the hex code
        -- instead of colorizing the background of text (very ugly)
        mode = 'virtualtext',
        virtualtext = '■',
        virtualtext_inline = 'before',
      },
    },
  },

  {
    -- discord status
    'vyfor/cord.nvim',
    version = '*',
    build = ':Cord update build',
    event = 'VeryLazy',

    opts = function ()
      local function editing_status(opts)
        local action = opts.is_read_only and 'Browsing' or 'Editing'

        local article = string.find(opts.filetype, '^[AEIOUaeiou]') and 'an' or 'a'
        local filetype = string.find(opts.filetype, '^Cord\\.') and '' or (' ' .. opts.filetype)
        local file_desc = article .. filetype

        return string.format("%s %s file", action, file_desc)
      end

      return {
        editor = {
          tooltip = 'Neovim'
        },
        idle = {
          show_status = false,
        },
        display = {
          swap_icons = true,
          flavor = 'accent',
          theme = 'atom',
        },

        text = {
          -- only show the filetype for privacy
          workspace = '',
          editing = editing_status,
          viewing = editing_status,
          plugin_manager = 'Managing plugins',

          -- ignore too specific buffers
          file_browser = true,
          lsp = true,
          notes = true,
          test = true,
          diagnostics = true,
          terminal = true,
          games = false,
        },
      }
    end,
  }
}
