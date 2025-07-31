return {
    "stevearc/conform.nvim",
    opts = function()
        -- Determine the path to the .clang-format file
        local clang_format_path = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins", "lang", "lang_cpp", "cpp", ".clang-format")
        return {
            formatters_by_ft = {
                cpp = { "clang-format" },
                c = { "clang-format" },
            },
            formatters = {
                ["clang-format"] = {
                    -- Pass the style configuration directly as a string
                    prepend_args = { "--style=file:" ..  clang_format_path},
                },
            },
        }
    end,
}
