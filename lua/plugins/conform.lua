return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            cpp = {
                -- No longer use nested function in an array
                "clang-format",
            },
            c = {
                "clang-format",
            },
        },
        -- Configure formatters
        formatters = {
            ["clang-format"] = {
                prepend_args = { "-style=Microsoft" },
            },
        },
        -- Do not add format_on_save as LazyVim handles this
    },
}
