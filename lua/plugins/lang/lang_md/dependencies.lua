-- Mason Dependencies
return
{
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "markdownlint-cli2", -- Linting
      "markdown-toc", -- Table of Contents
    },
  },
}