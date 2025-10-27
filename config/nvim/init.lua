-- Pre plugin loading config
require "options"

-- Load plugins
require "setup.lazy"

-- Post plugin loading config
require "mappings"
require "autocmds"
require "lsp"
