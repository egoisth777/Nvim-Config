return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = function(_, opts)
            -- Merge Cusomizationss with the default opts
            return vim.tbl_deep_extend("force", opts, {
                flavour = "mocha",
                transparent_background = true,
            })
        end,
    },
}
