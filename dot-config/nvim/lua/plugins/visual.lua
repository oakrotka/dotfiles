return {
  {
    -- show hex colors in files
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = {
        -- do not show colors for color names
        names = false,
        -- show color as a rectangle before a color
	      -- instead of colorizing the background of text (very ugly)
        mode = 'virtualtext',
        virtualtext = "■",
        virtualtext_inline = 'before',
      },
    },
  },
}
