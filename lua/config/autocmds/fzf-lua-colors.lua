-- Ensure fzf-lua properly inherits CyberDream colors
local M = {}

function M.setup()
  -- Create an autocommand group for fzf-lua color fixes
  local group = vim.api.nvim_create_augroup("FzfLuaCyberDreamFix", { clear = true })
  
  -- Function to manually set fzf colors based on CyberDream theme
  local function apply_fzf_cyberdream_colors()
    -- Wait a bit to ensure colorscheme is fully loaded
    vim.defer_fn(function()
      -- Check if fzf-lua is available
      local ok, fzf = pcall(require, "fzf-lua")
      if not ok then return end
      
      -- Force fzf-lua to regenerate its colors from the current colorscheme
      -- fzf.setup({
      --   fzf_colors = true,
      --   -- Explicitly set the color command for fzf binary
      --   fzf_opts = {
      --     ["--color"] = "dark",  -- Use dark base
      --   },
      -- })
      
      -- Additional highlight overrides specific to CyberDream
      -- These ensure fzf-lua windows match the theme
      local highlights = {
        FzfLuaNormal = { link = "Normal" },
        FzfLuaBorder = { link = "FloatBorder" },
        FzfLuaPreviewNormal = { link = "Normal" },
        FzfLuaPreviewBorder = { link = "FloatBorder" },
        FzfLuaTitle = { link = "Title" },
        FzfLuaPreviewTitle = { link = "Title" },
        FzfLuaScrollBorderFull = { link = "PmenuSbar" },
        FzfLuaScrollFloatFull = { link = "PmenuThumb" },
      }
      
      for hl_name, hl_def in pairs(highlights) do
        vim.api.nvim_set_hl(0, hl_name, hl_def)
      end
    end, 50)  -- 50ms delay to ensure colorscheme is loaded
  end
  
  -- Apply colors when colorscheme changes
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    pattern = "*",
    callback = apply_fzf_cyberdream_colors,
  })
  
  -- Also apply when entering fzf-lua buffer
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "fzf",
    callback = apply_fzf_cyberdream_colors,
  })
  
  -- Apply immediately if colorscheme is already loaded
  if vim.g.colors_name then
    apply_fzf_cyberdream_colors()
  end
end

-- Auto-setup
M.setup()

return M
