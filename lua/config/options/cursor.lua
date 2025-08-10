-- Global cursor configuration for high visibility
-- This will override any colorscheme cursor settings

local M = {}

local function apply_cursor_settings()
  -- High-contrast cursor colors using bright yellow/orange background
  vim.api.nvim_set_hl(0, "Cursor", { 
    fg = "#000000", -- Pure black text for maximum contrast
    bg = "#f1ff5e", -- Bright yellow background from your palette
    bold = true 
  })
  
  vim.api.nvim_set_hl(0, "CursorLine", { 
    bg = "#ffbd5e", -- Bright orange background for current line (high contrast)
    fg = "#000000"  -- Black text for readability
  })
  
  vim.api.nvim_set_hl(0, "CursorColumn", { 
    bg = "#ffbd5e", -- Bright orange background for current column
    fg = "#000000"  -- Black text for readability
  })
  
  -- Different bright yellow/orange cursor colors for different modes
  vim.api.nvim_set_hl(0, "iCursor", { 
    fg = "#000000", -- Black text
    bg = "#ffbd5e", -- Bright orange for insert mode
    bold = true 
  })
  
  vim.api.nvim_set_hl(0, "vCursor", { 
    fg = "#000000", -- Black text
    bg = "#f1ff5e", -- Bright yellow for visual mode
    bold = true 
  })
  
  vim.api.nvim_set_hl(0, "cCursor", { 
    fg = "#000000", -- Black text
    bg = "#ff6e5e", -- Keep red accent for command mode contrast
    bold = true 
  })
  
  -- Set cursor shape and blinking
  vim.opt.guicursor = {
    "n-v-c:block-Cursor/lCursor", -- Normal, visual, command mode: block cursor
    "i-ci-ve:ver25-iCursor/liCursor", -- Insert mode: vertical bar cursor (25% width)
    "r-cr:hor20-cCursor/lcCursor", -- Replace mode: horizontal bar cursor (20% height)
    "o:hor50", -- Operator pending: horizontal bar (50% height)
    "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
  }
  
  -- Enable cursor line and column highlighting
  vim.opt.cursorline = true
  -- vim.opt.cursorcolumn = true -- Uncomment if you want column highlighting too
end

function M.setup()
  -- Apply settings immediately
  apply_cursor_settings()
  
  -- Re-apply settings after any colorscheme change
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("CustomCursor", { clear = true }),
    callback = apply_cursor_settings,
  })
end

return M
