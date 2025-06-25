-- Python Language Configuration
-- This file automatically loads all Python-related plugins

return {
  -- Import all Python-specific plugin configurations
  { import = "plugins.lang_python.mason" },
  { import = "plugins.lang_python.mason_nvim_dap" },
  { import = "plugins.lang_python.neotest_python" },
  { import = "plugins.lang_python.nvim_cmp" },
  { import = "plugins.lang_python.nvim_dap" },
  { import = "plugins.lang_python.nvim_lspconfig" },
  { import = "plugins.lang_python.nvim_treesitter" },
} 