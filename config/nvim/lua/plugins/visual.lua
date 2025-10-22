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
    -- show hex colors in files (e.g. #b852dd)
    'catgoose/nvim-colorizer.lua',
    version = '*',
    event = 'BufReadPre',
    opts = {
      user_default_options = {
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
}
