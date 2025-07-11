-- lsp-ish utilities for languages
return {
  {
    -- syntax highlighting without an lsp
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    version = '*',

    branch = 'main',
    build = ':TSUpdate',

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

  {
    -- configs for language servers
    'neovim/nvim-lspconfig',
    lazy = false,
    version = '*',
  },

  {
    -- completion engine
    -- TODO: switch to blink.cmp once it doesn't require nightly
    -- (I do not trust prebuilt binaries)
    -- see required tracking issues:
    -- https://github.com/rust-lang/rust/issues/86656
    -- https://github.com/rust-lang/rust/issues/44839
    -- https://github.com/rust-lang/rust/issues/63292
    'hrsh7th/nvim-cmp',
    lazy = false,
    enabled = false, --TODO finish this
  }
}
