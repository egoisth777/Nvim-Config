-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- [[
-- Setting Line numebrs relatedd staff.
-- ]]
vim.opt.number = true
vim.opt.relativenumber = true --enable absolute line numbers
vim.opt.statuscolumn = "%s %4l|%3r  " -- set with absolute and relative number at the same time

-- Set the absolute and relative number colors
vim.api.nvim_set_hl(0, "StatusColumnAbsolute", { fg = "#ffcc66", bold = true }) -- Yellow absolute numbers
vim.api.nvim_set_hl(0, "StatusColumnRelative", { fg = "#99cc99" }) -- Green relative numbers
vim.api.nvim_set_hl(0, "StatusColumnSeparator", { fg = "#666666" }) -- Gray separator
vim.o.statuscolumn = "%#StatusColumnAbsolute# %4l%#StatusColumnSeparator#│%#StatusColumnRelative#%3r  "

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2 -- Set the display of Tab-Size to be 4 ('/t' Character will be displayed as 4 spaces)
vim.opt.shiftwidth = 2 -- Indent with 4 spaces
vim.opt.shiftround = true -- This will round the indentation to the nearest "Multiples" of "Shiftwidth" 7 -> 8 if pressing "Tab"
vim.opt.expandtab = true -- uses spaces instaed of tabs (Will be replacing the '\t' character with " " characters)
vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

--[[
-- Settings the Default Shell
--]]
--Set the default shell program
vim.opt.shell = "powershell.exe"
-- Adjust quoting
vim.opt.shellxquote = ""
vim.opt.shellquote = ""
--  Set the redirection scheme and encoding
vim.opt.shellredir = "2>&1 | Out-File -Encoding UTF8"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8"
