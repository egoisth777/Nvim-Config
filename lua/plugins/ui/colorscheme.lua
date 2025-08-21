return 
{
    -- Catppuccin configuration
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            flavour = "mocha",
            transparent_background = true, -- Enables full transparency for backgrounds
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
                cache = false,
                
                
                -- Add theme customizations for specific syntax elements
                highlights = {
                    -- Languages with Constructors and Destructors specific settings
                    ["@constructor"] = {link = "Function"},
                    
                    -- Override LSP semantic tokens for constructors
                    ["@lsp.mod.constructorOrDestructor.cpp"] = {link = "Function"},
                    ["@lsp.typemod.class.constructorOrDestructor.cpp"] = {link = "Function"},
                    
                    -- Globally applied Highlightings
                    Operator = { fg = "#ffffff", bold = true}, -- Your current white operators
                    Comment = {fg = "#77aa77", bold = false, italic = true},  -- Your current subtle green
                    
                    -- -- Settings for Variable
                    Identifier = { fg = "#5ef1ff", bold = true },
                    ["@variable"] = { fg = "#5ef1ff", bold = true },
                    ["@variable.builtin"] = {fg = "#ff5ea0", bold = true, italic = true},
                }
            })
        end,
    },
    {
        -- Install Kanagawa.nvim
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        opts = {
                transparent = true,
        }, 
        
    }, 
    {
        "EdenEast/nightfox.nvim", 
        opts = {
            transparent = true,
        }
        
    },
    -- LazyVim core configuration
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "cyberdream",
        },
    },
}

