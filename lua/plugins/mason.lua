-- The External Dependency Manager (Package Manager for nvim)
return {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall" },
    opts = {
        ensure_installed = {
            "clangd", -- lsp server, if not installed
            "clang-format", -- standalone formatter binary in llvm project
            "codelldb", -- lldb for debugger setup
        },
    },
}
