-- plugins for previewing output of markup languages in the browser
return {
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    -- this version of the config requires yarn,
    -- but if I were to ever uninstall it then it is also possible 
    -- to download a binary release
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_auto_close = 0
    end,
  },

  {
    'chomosuke/typst-preview.nvim',
    version = '*',
    -- may be deleted when #88 merges
    cmd = {
      "TypstPreview",
      "TypstPreviewToggle",
      "TypstPreviewFollowCursor",
      "TypstPreviewNoFollowCursor",
      "TypstPreviewFollowCursorToggle",
    },
    opts = {
      -- assumes these binaries to be installed there
      dependencies_bin = {
        ['tinymist'] = '/usr/bin/tinymist',
        ['websocat'] = '/usr/bin/websocat'
      },
    },
  },
}
