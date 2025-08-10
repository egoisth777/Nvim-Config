-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Load cursor autocmds
require("config.autocmds.cursor")

-- Automatically saving

-- Auto-save every 30 seconds for modified buffers
vim.api.nvim_create_autocmd(
    -- Trigger
    { "BufLeave", "CursorHold", "CursorHoldI", "FocusLost" },
    -- Callback
    {
        pattern = "*",
        callback = function()
            if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" then
                vim.cmd("silent! write")
            end
        end,
    }
)

-- Set the delay for CursorHold events (in milliseconds)
vim.opt.updatetime = 15000 -- if you don't move cursor for 15s
