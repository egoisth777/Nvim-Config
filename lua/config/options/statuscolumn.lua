-- [[
-- Setting Line numbers related staff.
-- ]]

vim.opt.number = true -- enable line number options
vim.opt.relativenumber = true --enable absolute line numbers

-- Create custom highlight groups that are more specific to override any theme settings
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Define these highlight groups after colorscheme load to override it
    vim.api.nvim_set_hl(0, "MyAbsoluteLineNr", { fg = "#06402b", default = false }) -- For absolute numbers
    vim.api.nvim_set_hl(0, "MySeparatorLine", { fg =  "#89b4fa", bold = true, default = false }) -- For the separator line
    vim.api.nvim_set_hl(0, "MyRelativeLineNr", { fg = "#b4befe", bold = false, default = false }) -- For the separator line
    vim.api.nvim_set_hl(0, "MyCursorLineNr", { fg = "#ffa500", bold = true, default = false }) -- For relative numbers
  end,
})

-- Set immediate color highlighting groups
vim.api.nvim_set_hl(0, "MyAbsoluteLineNr", { fg = "#06402b", default = false }) -- For absolute numbers
vim.api.nvim_set_hl(0, "MySeparatorLine", { fg =  "#89b4fa", bold = true, default = false }) -- For the separator line
vim.api.nvim_set_hl(0, "MyRelativeLineNr", { fg = "#b4befe", bold = false, default = false }) -- For the separator line
vim.api.nvim_set_hl(0, "MyCursorLineNr", { fg = "#ffa500", bold = true, default = false }) -- For relative numbers
-- for reference

-- Use a function to create custom statuscolumn format
local function custom_statuscolumn()
    local filetype = vim.bo.filetype
    local buftype = vim.bo.buftype
    local lnum = vim.v.lnum
    local rnum = vim.v.relnum
    
    local result = ""
    
    -- Check if it's Neo-tree buffer
    if filetype == "neo-tree" then
        -- For Neo-tree, use simpler numbering with fixed width 
        -- and different colors (no relative numbers since Neo-tree doesn't properly support them)
        local fixed_width = 2  -- Adjust as needed for your Neo-tree depth
        local abs_num = string.format("%" .. fixed_width .. "s", lnum)
        result = result .. "%#MyAbsoluteLineNr#" .. abs_num .. " "
        result = result .. "%#MySeparatorLine#| "
        result = result .. "%#MyRelativeLineNr#" .. string.format("%" .. fixed_width .. "s", vim.v.relnum) .. " "
        return result
    end
    
    -- Skip other special buffers 
    if buftype ~= "" and filetype ~= "neo-tree" then
        return "" -- Return empty statuscolumn for special buffers that aren't Neo-tree
    end
    
    -- Calculate the width needed for line numbers based on total lines in buffer
    local line_count = vim.api.nvim_buf_line_count(0)
    local width = math.max(2, #tostring(line_count))
    
    -- Format for absolute line number with proper highlight and padding
    local abs_num = string.format("%" .. width .. "s", lnum)
    result = result .. "%#MyAbsoluteLineNr#" .. abs_num .. " "
    
    -- Add separator with proper highlight
    result = result .. "%#MySeparatorLine#| "
    
    -- Format for relative line number with proper highlight
    if rnum > 0 then
        -- Right align relative numbers
        local rel_num = string.format("%" .. width .. "s", rnum)
        result = result .. "%#MyRelativeLineNr#"
        result = result .. rel_num .. " "
    else
        -- For current line (where relnum is 0)
        local cur_num = string.format("%" .. width .. "s", lnum)
        result = result .. "%#MyCursorLineNr#"
        result = result .. cur_num .. " "
    end
    
    return result
end

-- Set the statuscolumn to use our custom function
vim.opt.statuscolumn = "%{%v:lua.require'config.options.statuscolumn'.get_statuscolumn()%}"

-- Export the function for the statuscolumn to use
return {
  get_statuscolumn = custom_statuscolumn
}

