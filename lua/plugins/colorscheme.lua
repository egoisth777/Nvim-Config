return 
{
    -- Catppuccin configuration
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            flavour = "mocha",
            transparent_background = true, -- Enables full transparency for backgrounds
            background = 
            {
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
    -- abyss colorscheme
    {
        "barrientosvctor/abyss.nvim",
        name = "abyss",
        lazy = true,
        priority = 1000,
        opts = {},
        config = function()
            -- Setup MUST happen before applying colorscheme
            require("abyss").setup({
                italic_comments = true,
                italic = false,
                bold = true,
                transparent_background = true,
                treesitter = true,
                overrides = {},
            })
            -- Apply colorscheme AFTER setup
            vim.cmd.colorscheme("abyss")
        end,
    },
    {
        "scottmckendry/cyberdream.nvim",
        name = "cyberdream",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                variant = "auto",
                transparent = true,
                italic_comments = true,
                borderless_pickers = true,
                terminal_colors = true,
                cache = true,
            })
        end,
    },
    {
        -- Install Kanagawa.nvim
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        opts = {
                transparent_background = true,
        }, 
        
    },
    {
        "EdenEast/nightfox.nvim", 
    },
    {
        "sainnhe/everforest", 
        name = "everforest", 
        opts = 
        {
            transparent_background = true, 
        }
    },
    -- LazyVim core configuration
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
