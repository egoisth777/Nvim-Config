return {
  -- LuaSnip configuration for LaTeX
  {
    "L3MON4D3/LuaSnip",
    ft = { "plaintex" },
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local luasnip = require("luasnip")

      -- Configure LuaSnip
      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
      })

      -- Load the custom snippet loader
      local snippet_loader = dofile(vim.fn.stdpath("config") .. "/Snippets/loader.lua")

      -- Load tex snippets from the Snippets/tex/ directory
      snippet_loader.load_snippets("tex")

      -- Also load for plaintex filetype
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "plaintex",
        callback = function()
          -- Make tex snippets available for plaintex files too
          luasnip.filetype_extend("plaintex", { "tex" })
        end,
      })

      -- Optional: Add some keymaps for snippet navigation
      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { silent = true, desc = "Expand snippet or jump forward" })

      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { silent = true, desc = "Jump backward in snippet" })

      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { silent = true, desc = "Cycle through snippet choices" })
    end,
  },
}
