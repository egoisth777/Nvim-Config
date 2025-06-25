-- The External Dependency Manager (Package Manager for nvim)
return {
  "williamboman/mason.nvim",
  opts = {
      ensure_installed = {
        "pyrefly",
        "pyright",
        "ruff",
      },
  },
}
