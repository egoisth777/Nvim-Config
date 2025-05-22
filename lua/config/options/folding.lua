-- -- lua/config/folding.lua
-- -- UFO folding configuration

-- -- Make vim a local variable to fix lint warnings
-- local vim = vim

-- -- Disable fold column until UFO is properly loaded
-- vim.o.foldcolumn = '0'
-- vim.o.foldlevel = 99
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true

-- -- Important: disable the default fold method to let UFO handle it
-- vim.o.foldmethod = 'manual'

-- -- Set fillchars for folding (fix the E1511 error)
-- vim.opt.fillchars = {
--   eob = " ",
--   fold = " ",
--   foldsep = " ",
--   foldopen = "",
--   foldclose = ""
-- }

-- -- The rest of the configuration will be applied after the plugin is loaded
-- -- Custom fold text handler is now in the plugin configuration file

-- -- Setup will be done in the plugin configuration
-- -- This file only sets up the basic fold options