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
        plaintex = { 'lsp', 'snippets', 'path'},
      },
    },
    snippets = {
      preset = 'luasnip'
    }
  }
}
