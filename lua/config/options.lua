-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Status Column
require("config.options.statuscolumn")

-- Set up Tab size ...
require("config.options.editorsettings")

-- filetype detection
require("config.options.ftdetect")


-- Python LSP Configuration
-- Set to "pyrefly" to use pyrefly (default)
-- Set to "pyright" to use pyright
-- Set to "basedpyright" to use basedpyright
vim.g.lazyvim_python_lsp = "pyrefly"

-- Set to "ruff" to use ruff (default)
-- Set to "ruff_lsp" to use the old LSP implementation
vim.g.lazyvim_python_ruff = "ruff"

