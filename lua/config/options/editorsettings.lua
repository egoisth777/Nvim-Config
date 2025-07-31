-- use spaces for tab
vim.opt.tabstop = 4 -- Set the display of Tab-Size to be 4 ('/t' Character will be displayed as 4 spaces)


vim.opt.shiftwidth = 4 -- Indent with 4 spaces
vim.opt.shiftround = true -- This will round the indentation to the nearest "Multiples" of "Shiftwidth" 7 -> 8 if pressing "Tab"
vim.opt.expandtab = true -- uses spaces instaed of tabs (Will be replacing the '\t' character with " " characters)
vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

--[[
-- Settings the Default Shell
--]]
--Set the default shell program
vim.opt.shell = "pwsh.exe"

-- Adjust quoting
vim.opt.shellxquote = ""
vim.opt.shellquote = ""

--  Set the redirection scheme and encoding
vim.opt.shellredir = "2>&1 | Out-File -Encoding UTF8"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"