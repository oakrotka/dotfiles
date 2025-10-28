return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    cmd = 'Telescope',

    opts = {
      defaults = {
        layout_strategy = 'flex',
        sorting_strategy = 'ascending',
        layout_config = {
          prompt_position = 'top',
          flip_columns = 190,
        },
      },
    },

    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>',  desc = 'Find files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>',   desc = 'Live grep' },
      { '<leader>fh', '<cmd>Telescope man_pages<cr>',   desc = 'Search man pages' },
      { '<leader>fc', '<cmd>Telescope git_commits<cr>', desc = 'Search git commits' },
      { '<leader>fS', '<cmd>Telescope git_status<cr>',  desc = 'Search git status' },
      { '<leader>f/', '<cmd>Telescope current_buffer_fuzzy_find<cr>',
                                                        desc = 'Fuzzy search buffer' },
      { '<leader>fs', function ()
        local menu = require 'telescope.builtin'
        local ts = vim.treesitter.language

        if #vim.lsp.get_clients({bufnr = 0}) > 0 then
          menu.lsp_document_symbols()
        elseif ts.add(ts.get_lang(vim.bo.filetype)) then
          menu.treesitter()
        else
          vim.notify(
            'Could not find LSP server or treesitter parser to display document symbols.',
            vim.log.levels.ERROR
          )
        end
      end, desc = 'Search document symbols' },

      -- TODO maybe replace lsp reference-implementation-definitions keymaps with telescope ones?
    }
  },

  {
    'romgrk/barbar.nvim',
    version = nil,  -- I don't think I'm getting a release for my bugfix soon :(
    -- I *could* technically set up an event that triggers the first time more than 2 buffers are
    -- opened, but is it worth it? hmm
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function() vim.g.barbar_auto_setup = false end,

    opts = {
      auto_hide = 1,
      minimum_padding = 0,
      maximum_padding = 3,
    },
    keys = {
      { '<A-,>',   '<cmd>BufferPrevious<cr>',     desc = 'Previous buffer' },
      { '<A-.>',   '<cmd>BufferNext<cr>',         desc = 'Next buffer' },
      { '<A-s-,>', '<cmd>BufferMovePrevious<cr>', desc = 'Move buffer back' },
      { '<A-s-.>', '<cmd>BufferMoveNext<cr>',     desc = 'Move buffer forward' },
      { '<A-x>',   '<cmd>BufferClose<cr>',        desc = 'Close current buffer' },
      { '<A-s-x>', '<cmd>BufferRestore<cr>',      desc = 'Restore buffer' },
      { '<A-p>',   '<cmd>BufferPick<cr>',         desc = 'Pick buffer' },
      { '<A-d>',   '<cmd>BufferPickDelete<cr>',   desc = 'Close picked buffer' },
    },
  },

  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
    -- this plugin advises against lazy loading, so disable it if anything goes wrong
    keys = {
      { '<C-n>', '<cmd>NvimTreeToggle<cr>', desc = 'File tree' },
    }
  },
}
