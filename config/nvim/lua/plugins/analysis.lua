-- utilities for intelligent code analysis etc.
return {
  {
    -- configs for language servers
    'neovim/nvim-lspconfig',
    lazy = false,
    version = '*',
  },

  {
    -- syntax highlighting without an lsp, intelligent actions
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
    -- view context of the current scope with treesitter
    'nvim-treesitter/nvim-treesitter-context',
    lazy = false,
    opts = {
      min_window_height = 20,
      multiline_threshold = 7,
      trim_scope = 'inner',
      mode = 'topline',
    }
    -- TODO keybindings for toggling, jumping to context
  },

  {
    -- smart selection
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = 'VeryLazy',
    version = '*',
    branch = 'main',

    config = function ()
        local selection = require 'nvim-treesitter-textobjects.select'
        local movement  = require 'nvim-treesitter-textobjects.move'
        local mvmodes = { 'n', 'x', 'o' }

        local map = vim.keymap.set
        -- map a key to query selection
        local function smap(keys, query, desc, group)
            map({ 'x', 'o' }, keys, function ()
                selection.select_textobject(query, group or 'textobjects')
            end, {desc = 'Select ' .. desc})
        end
        -- map a key to inner and outer query selections
        local function smap2(key, query, group)
            smap('a' .. key, '@' .. query .. '.outer', 'outer ' .. query, group)
            smap('i' .. key, '@' .. query .. '.inner', 'inner ' .. query, group)
        end
        -- map a key to query movement:
        -- - ] and [ for next and previous, respectively
        -- - optional `e` after bracket to go to the end of object instead of the start
        local function mvmap(key, query, desc, group)
            group = group or 'textobjects'

            map(mvmodes, ']' .. key, function ()
                movement.goto_next_start(query, group)
            end, {desc = 'Go to next ' .. desc .. ' start'})

            map(mvmodes, '[' .. key, function ()
                movement.goto_previous_start(query, group)
            end, {desc = 'Go to previous ' .. desc .. ' start'})

            map(mvmodes, ']e' .. key, function ()
                movement.goto_next_end(query, group)
            end, {desc = 'Go to next ' .. desc .. ' end'})

            map(mvmodes, '[e' .. key, function ()
                movement.goto_previous_end(query, group)
            end, {desc = 'Go to previous ' .. desc .. ' end'})
        end
        -- map a key to all actions above for a textobject query
        local function fullmap(key, query)
            smap2(key, query, 'textobjects')
            mvmap(key, '@' .. query .. '.outer', query, 'textobjects')
        end

        -- repeatable move
        local mvrepeat = require "nvim-treesitter-textobjects.repeatable_move"
        map(mvmodes, ";", mvrepeat.repeat_last_move)
        map(mvmodes, ",", mvrepeat.repeat_last_move_opposite)
        -- why do I even have to set this?
        map(mvmodes, "f", mvrepeat.builtin_f_expr, { expr = true })
        map(mvmodes, "F", mvrepeat.builtin_F_expr, { expr = true })
        map(mvmodes, "t", mvrepeat.builtin_t_expr, { expr = true })
        map(mvmodes, "T", mvrepeat.builtin_T_expr, { expr = true })

        fullmap('f', 'function')
        fullmap('P', 'parameter')
        fullmap('c', 'class')
        fullmap('r', 'return')

        -- these queries like to be unpredictable
        fullmap('F', 'call')  -- "[F]unction call"
        fullmap('B', 'block')
        fullmap('C', 'comment')
        fullmap('i', 'conditional')  -- "[i]f statement" - in practice, a lot more compilcated
        fullmap('l', 'loop')

        smap('aS',  '@statement.outer', 'statement')
        mvmap('S',  '@statement.outer', 'statement')
        -- "[i]nside [a]ssignment's [<movement>]-hand side"
        smap('iah', '@assignment.lhs',  'assignment lhs')
        smap('ial', '@assignment.rhs',  'assignment rhs')
    end
  },  -- nvim-treesitter-textobjects

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
    -- build = "cargo build --release",  -- uncomment this

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
