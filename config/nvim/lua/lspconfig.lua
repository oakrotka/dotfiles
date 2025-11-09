vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      analysis = {
        -- I disabled most of the typing stuff here as it's more annoying than useful in python
        typeCheckingMode = 'off',
        inlayHints = {
          variableTypes = false,
          callArgumentNames = false,
        }
      }
    }
  }
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        -- get the language server to recognize the `vim` global
        -- (not the *perfect* solution as it will also recogize it beyond neovim configurations)
        globals = { 'vim' }
      }
    }
  }
})

vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      check = {
        command = 'clippy',
      },
      inlayHints = {
        parameterHints = {
          enable = false
        },
        typeHints = {
          enable = false
        },
      }
    }
  }
})
