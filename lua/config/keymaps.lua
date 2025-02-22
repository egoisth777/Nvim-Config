vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- keymappings
-- normal mode settings
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>") -- setting "," + "h" to cancel the highlight
vim.keymap.set("n", "<leader>d", '"_x', { noremap = true, silent = true }) -- setting leader + d to " " " + "_" + "d"
vim.keymap.set("n", "<leader>dd", '"_dd', { noremap = true, silent = true }) -- setting leader + d to " " " + "_" + "d"
