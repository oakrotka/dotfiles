-- option to disable language servers e.g. when they use too much memory
if vim.env.NVIM_NOLSP ~= nil then
  return
end

-- load custom lsp configurations
require "lspconfig"

-- enable lsp servers (usually defined by nvim-lspconfig plugin)
vim.lsp.enable {
  'basedpyright',
  'clangd',
  'elixirls',
  'elp',
  'gleam',
  'jdtls',
  'julials',
  'lua_ls',
  'ocamllsp',
  'rust_analyzer',  -- consider switching to rustaceanvim for more features
  'tinymist',
}
