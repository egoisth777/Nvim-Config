return {
  "SirVer/ultisnips",
  lazy = false,
  config = function()
    vim.g.UltiSnipsExpandOrJumpTrigger = "<tab>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
    vim.g.UltiSnipsSnippetDirectories = { "./UltiSnips" }
  end,
}
