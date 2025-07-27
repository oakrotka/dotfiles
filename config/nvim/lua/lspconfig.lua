vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        -- get the language server to recognize the `vim` global
        -- (not the *perfect* solution as it will also recogize it beyond neovim configurations)
        globals = {'vim'}
      }
    }
  }
})

