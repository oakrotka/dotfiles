-- lsp-ish utilities for languages - highlighting, autocomplete, etc
return {
  {
    -- configs for language servers
    'neovim/nvim-lspconfig',
    lazy = false,
    version = '*',
  },

  {
    -- syntax highlighting without an lsp
    'nvim-treesitter/nvim-treesitter',
    event = {'BufReadPost', 'BufNewFile'},
    cmd = {'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo'},
    version = '*',

    branch = 'main',
    build = ':TSUpdate',

    opts = {
      ensure_installed = {'bash', 'fish', 'markdown', 'python', 'vim', 'vimdoc'},
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
    -- completion engine
    'Saghen/blink.cmp',
    event = 'InsertEnter',
    version = '*',

    -- TODO: switch to building binaries yourself instead of relying on binaries built by github
    -- when this project stops requiring nightly
    -- see required tracking issues:
    -- https://github.com/rust-lang/rust/issues/86656
    -- https://github.com/rust-lang/rust/issues/44839
    -- https://github.com/rust-lang/rust/issues/63292
    --
    -- build = "RUSTFLAGS=\"-C target-cpu=native\" cargo build --release",  -- uncomment this

    opts = {
      -- minor TODO: make the theme prettier

      signature = {
        enabled = true,
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
        },
      },

      keymap = {
        preset = 'none',
        -- select choice
        ['<Tab>'] = {'select_and_accept', 'fallback'},
        -- move choice up/down
        ['<C-p>'] = {'select_prev', 'fallback_to_mappings'},
        ['<C-n>'] = {'select_next', 'fallback_to_mappings'},
        -- deselect
        ['<C-e>'] = {'hide'},
        -- show/hide completion, signature, documentation
        ['<C-space>'] = {
          'show',
          'show_signature',
          'hide_signature',
          'show_documentation',
          'hide_documentation'
        },
        -- scroll documentation
        ['<C-u>'] = {'scroll_documentation_up', 'fallback'},
        ['<C-d>'] = {'scroll_documentation_down', 'fallback'},
      },
    },
  },
}
