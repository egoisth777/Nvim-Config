-- Cursor autocmds for high visibility
-- This ensures cursor settings persist across colorscheme changes

local function apply_cursor_settings()
  -- High-contrast cursor colors using bright yellow/orange background
  
  vim.api.nvim_set_hl(0, "CursorLine", { 
    bg = "#ffbd5e", -- Bright orange background for current line (high contrast)
    fg = "#000000"  -- Black text for readability
  })
    
  -- Set cursor shape and blinking
  vim.opt.guicursor = {
    "n-v-c:block-Cursor/lCursor", -- Normal, visual, command mode: block cursor
    "i-ci-ve:ver25-iCursor/liCursor", -- Insert mode: vertical bar cursor (25% width)
    "r-cr:hor20-cCursor/lcCursor", -- Replace mode: horizontal bar cursor (20% height)
    "o:hor50", -- Operator pending: horizontal bar (50% height)
    "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
  }
  
  -- Enable cursor line highlighting only (no column)
  vim.opt.cursorline = true
end

-- Apply settings immediately on load
apply_cursor_settings()

-- Create autocmd group for cursor settings
local cursor_group = vim.api.nvim_create_augroup("CustomCursor", { clear = true })

-- Re-apply cursor settings after any colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  group = cursor_group,
  callback = apply_cursor_settings,
  desc = "Apply custom cursor highlights after colorscheme changes"
})

-- -- Apply cursor settings when entering a buffer (extra safety)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = cursor_group,
--   callback = apply_cursor_settings,
--   desc = "Ensure cursor highlights are applied when entering buffers"
-- })
