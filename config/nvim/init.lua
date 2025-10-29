-- Pre plugin loading config
require "options"
require "mappings"

-- Load plugins
require "setup.lazy"

-- Post plugin loading config
require "autocmds"
require "lsp"
