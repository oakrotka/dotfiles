-- utilities for working with miscellaneous languages
return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    version = '*',  -- newest stable version
    opts = {
      ensure_installed = {"lua", "vim", "vimdoc", "typst", "rust", "c"},

      highlight = {
        enable = true,
      },

      indent = {
        -- TODO maybe change this if langs like julia/fish will still act weird
        enable = true,
      }
    }
  },
}
