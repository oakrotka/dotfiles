return {
    {
        -- automatic bracket pairing
        -- I chose this plugin because it has a nicer way for configuring than nvim-autopairs
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },

        opts = {
            tabout = {
                enable = true,
                hopout = true,
                map = '<A-t>',
                cmap = '<A-t>',
            },

            config_internal_pairs = {
                { '<!--', '-->', ft = { 'html', 'markdown', 'svelte' }, newline = true },
            },

            { '*',     '*', ft = { 'markdown' }, },
            { '**',   '**', ft = { 'markdown' }, },
            { '_',     '_', ft = { 'markdown' }, },
            { '__',   '__', ft = { 'markdown' }, },

            { '"""', '"""',                              newline = true },
            { '```', '```', ft = { 'typst' },            newline = true },

            { '$',     '$', ft = { 'typst', 'tex' },     space = true, newline = true },
            { '/*',   '*/', ft = { 'c', 'cpp', 'ispc' }, space = true, newline = true },
            { '(*',   '*)', ft = { 'ocaml' },            space = true, newline = true },
            { '/-',   '-/', ft = { 'lean' },             space = true, newline = true },
        }
    },

    {
        'kylechui/nvim-surround',
        version = '*',
        event = 'VeryLazy',
        opts = {},
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
}
