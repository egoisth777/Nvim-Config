return {
    -- LazyVim core configuration
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },

    -- Catppuccin configuration
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            flavour = "mocha",
            transparent_background = true, -- Enables full transparency for backgrounds
            background = {
                light = "latte",
                dark = "mocha",
            },
            integrations = {
                cmp = true,
                nvimtree = true,
                telescope = true,
                treesitter = true,
                -- Add other integrations you use
            },
        },
    },
}
