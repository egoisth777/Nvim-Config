vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus=  2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.relativenumber = true --enable absolute line numbers

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true


-- keymappings
-- normal mode settings
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>') -- setting "," + "h" to cancel the highlight 
vim.keymap.set('n', '<leader>d', '"_x', {noremap = true, silent = true}) -- setting leader + d to " " " + "_" + "d"
vim.keymap.set('n', '<leader>dd', '"_dd', {noremap = true, silent = true}) -- setting leader + d to " " " + "_" + "d"

