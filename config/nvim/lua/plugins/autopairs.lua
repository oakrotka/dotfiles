return {
  {
    -- automatic bracket pairing
    -- I chose this plugin because it has a nicer way for configuring than nvim-autopairs
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
      { '$', '$', ft = { 'typst', 'tex' }, space = true },
      { '(*', '*)', ft = { 'ocaml' }, space = true },
    }
  },

  {
    -- FIXME: doesn't work
    'tpope/vim-endwise',
    event = 'InsertEnter',
    version = false,  -- last release in 2022 :(
    enabled = false,  -- delete when fixed
  },

  {
    -- automatic closing of xml-like tags
    'windwp/nvim-ts-autotag',
    event = 'VeryLazy',
    config = true,
  }

  -- TODO: nvim-surround
}
