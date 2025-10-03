-- The External Dependency Manager (Package Manager for nvim)
return {
  "mason-org/mason.nvim",
  opts = {
      ensure_installed = {
        "pyrefly",
        "pyright",
        "ruff",
      },
  },
}
