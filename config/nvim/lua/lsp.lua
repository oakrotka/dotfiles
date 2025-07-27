-- load custom lsp configurations
require "lspconfig"

-- enable lsp servers (usually defined by nvim-lspconfig plugin)
vim.lsp.enable {
  -- "basedpyright",  -- complains too much
  "clangd",
  "gleam",
  "julials",
  "lua_ls",
  "ocamllsp",
  "rust_analyzer",  -- consider switching to rustaceanvim for more features
  "tinymist",
}
