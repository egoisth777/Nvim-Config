-- Currently Contains All Colorscheme set up for nvim
--[[
    1. catppuccin
    2. abyss
    3. cyberdream
    4. kanagawa
    5. nightfox
--]]

-- END- - - - - - - - - - - - - - - - - - - - - -  

return
{
    -- Catppuccin configuration
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts =
        {
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
                    
                    -- Global Settings---------------------------------------------------------- 
                        -- White 
                        Identifier = { fg = "#ffffff", bold = true}, 
                        
                        -- Yellow (Face Value)

                        Number = {fg = "#f1ff5e" , italic = true},
                        String = {fg = "#f1ff5e" , italic = true},
                        
                        -- Your current subtle green
                        Comment = {fg = "#77aa77", bold = false, italic = true},  
                    
                        -- Orange
                        Keyword = {fg = "#ffbd5e", bold = false}, 
                        
                        -- Magenta
                        Type = {fg = "#ff5ef1", bold = false},
                        
                        -- Neon Green
                        Function = {fg = "#5eff6c", bold = true, italic = true},  
                        Operator = { fg = "#5eff6c"},
                       
                        -- Neon Pink
                        Special = {fg = "#ff5ea0", italic = true},

                    -- END OF GLOBAL SETTINGS ---------------------------------------------------

                    CursorLine = {bg = "#354456", bold = true},
                    Visual = {bg = "#507789", italic = true, bold = true, undercurl = true},

                    -- Word under cursor (via LSP/illuminate)
                    LspReferenceText  = { bg = "#507789" },
                    LspReferenceRead  = { bg = "#507789" },
                    LspReferenceWrite = { bg = "#507789" },
                    
                    IlluminatedWordText  = { bg = "#507789" },
                    IlluminatedWordRead  = { bg = "#507789" },
                    IlluminatedWordWrite = { bg = "#507789" },

                    -- LSP and Language Settings

                    -- Language Settings
                    ["@variable"] = { fg = "#ffffff", bold = true },
                    ["@keyword.type"] = {link = "Keyword"},
                    ["@constructor"] = {link = "Function"},
                    ["@type.builtin"] = {link = "Type"},
                    ["@module"] = {fg = "#5ef1ff"},
                    
                    -- LSP Settings
                    ["@lsp.mod.constructorOrDestructor.cpp"] = {link = "Function"},
                    ["@lsp.typemod.class.constructorOrDestructor.cpp"] = {link = "Function"},
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

