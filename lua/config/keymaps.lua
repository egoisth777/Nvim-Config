vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.relativenumber = true --enable absolute line numbers

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2 -- Set the display of Tab-Size to be 4 ('/t' Character will be displayed as 4 spaces)
vim.opt.shiftwidth = 2 -- Indent with 4 spaces
vim.opt.shiftround = true -- This will round the indentation to the nearest "Multiples" of "Shiftwidth" 7 -> 8 if pressing "Tab"
vim.opt.expandtab = true -- uses spaces instaed of tabs (Will be replacing the '\t' character with " " characters)

-- keymappings
-- normal mode settings
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>") -- setting "," + "h" to cancel the highlight
vim.keymap.set("n", "<leader>d", '"_x', { noremap = true, silent = true }) -- setting leader + d to " " " + "_" + "d"
vim.keymap.set("n", "<leader>dd", '"_dd', { noremap = true, silent = true }) -- setting leader + d to " " " + "_" + "d"
