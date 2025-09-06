-- Auto-save every 30 seconds for modified buffers
-- Optimized for LaTeX performance
vim.api.nvim_create_autocmd(
    -- Trigger - reduced frequency for better performance
    { "BufLeave", "FocusLost" },  -- Removed CursorHold events to reduce lag
    -- Callback
    {
        pattern = "*",
        callback = function()
            -- Add file type check to avoid saving temporary LaTeX files
            local ft = vim.bo.filetype
            local filename = vim.fn.expand("%")
            
            -- Skip auto-save for certain file types or patterns that might cause issues
            if ft == "tex" and (filename:match("%.aux$") or filename:match("%.log$") or filename:match("%.toc$")) then
                return
            end
            
            if vim.bo.modified and not vim.bo.readonly and filename ~= "" then
                vim.cmd("silent! write")
            end
        end,
    }
)

-- Optimized updatetime - increased from 15s to reduce CursorHold frequency
vim.opt.updatetime = 30000 -- 30 seconds instead of 15
