return {
  -- Disable blink.cmp for plaintex files
  "saghen/blink.cmp",
  opts = {
    enabled = function()
      return not vim.tbl_contains({ "plaintex" }, vim.bo.filetype)
    end,
    sources = {
      default = { 'lsp', 'snippets', 'buffer', 'path' },
      per_filetype = {
        plaintex = { 'lsp', 'snippets', 'path' },
      },
    },
    snippets = {
      preset = 'luasnip'
    },

    keymap = {
      -- The 'default' preset provides many sane keybindings.
      -- We will build upon it.
      preset = 'default',

      -- The recommended mapping for Tab and Shift-Tab.
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      
      -- Set Enter to accept completion when menu is visible, otherwise insert newline
      ['<CR>'] = { 'accept', 'fallback' },
    },
  }
}
