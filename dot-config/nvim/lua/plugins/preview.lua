-- plugins for previewing output of markup languages in the browser
return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
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
    cmd = {"TypstPreview", "TypstPreviewToggle", "TypstPreviewStop", "TypstPreviewUpdate"},
    version = '*',
    opts = {
      -- assumes these binaries to be installed there
      dependencies_bin = {
        ['tinymist'] = '/usr/bin/tinymist',
        ['websocat'] = '/usr/bin/websocat'
      },
    },
  },
}
