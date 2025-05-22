vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- keymappings
-- normal mode settings
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>") -- setting "," + "h" to cancel the highlight
vim.keymap.set("n", "<leader>d", '"_x', { noremap = true, silent = true }) -- setting leader + d to " " " + "_" + "d"
vim.keymap.set("n", "<leader>dd", '"_dd', { noremap = true, silent = true }) -- setting leader + d to " " " + "_" + "d"


-- -- [[
-- -- Keymap settings for @ufo folding
-- -- ]]

-- -- Using ufo provider need remap `zR` and `zM`
-- vim.keymap.set('n', 'zR', function() require('ufo').openAllFolds() end)
-- vim.keymap.set('n', 'zM', function() require('ufo').closeAllFolds() end)
-- vim.keymap.set('n', 'zr', function() require('ufo').openFoldsExceptKinds() end)
-- vim.keymap.set('n', 'zm', function() require('ufo').closeFoldsWith() end)

-- -- Add peek functionality
-- vim.keymap.set('n', 'K', function()
--     local winid = require('ufo').peekFoldedLinesUnderCursor()
--     if not winid then
--         -- If ufo peek didn't work, fall back to vim.lsp.buf.hover()
--         vim.lsp.buf.hover()
--     end
-- end, { desc = 'Peek fold or hover' })

-- -- Add navigation between folds
-- vim.keymap.set('n', '[z', function() require('ufo').goPreviousClosedFold() end, { desc = 'Go to previous fold' })
-- vim.keymap.set('n', ']z', function() require('ufo').goNextClosedFold() end, { desc = 'Go to next fold' })