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
    lazy = false,
    version = '*',

    branch = 'main',
    build = ':TSUpdate',

    init = function ()
      -- stupid boilerplate function to check whether we can enable treesitter for a buffer every
      -- time we open one, because neovim or the treesitter plugin cannot figure out how to have
      -- an option to autoload installed parsers and I cannot be bothered to write an autocmd for
      -- every parser I install
      vim.api.nvim_create_autocmd('FileType', {
        callback = function ()
          local lang = vim.treesitter.language
          if lang.add(lang.get_lang(vim.bo.filetype)) then
            vim.treesitter.start()
          end
        end
      })
    end,
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
        ['<Tab>'] = { 'select_and_accept', 'fallback' },
        -- move choice up/down
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
        -- deselect
        ['<C-e>'] = { 'hide' },
        -- show/hide completion, signature, documentation
        ['<C-space>'] = {
          'show',
          'show_signature',
          'hide_signature',
          'show_documentation',
          'hide_documentation'
        },
        -- scroll documentation
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      },
    },
  },

  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        multiline = {
          enabled = true,
          tabstop = vim.opt.tabstop,
        },
      },
    },
  },
}
