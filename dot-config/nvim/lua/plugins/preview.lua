-- plugins for previewing output of markup languages in the browser
return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = {"MarkdownPreviewToggle", "MarkdownPreview"},
    -- FIXME: cmd lazyloading doesn't work, this plugin has to be preloaded upon entering the file
    -- because for some reason lazy.nvim cannot detect the command otherwise
    ft = "markdown",
    -- this version of the config requires yarn,
    -- but if I were to ever uninstall it then it is also possible 
    -- to download a binary release
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
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
