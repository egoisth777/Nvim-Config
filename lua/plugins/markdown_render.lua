-- filepath: c:\Users\egois\AppData\Local\nvim\lua\plugins\markdown_render.lua
return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = 
    { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    opts = 
    {
      log_level = 'debug', -- set debug mode on
    },
    ft = 
    { "markdown", "norg", "rmd", "org", "codecompanion" },

    latex = {
      enabled = true,
      converter = "latex2text",
    },
    config = 
    function(_, opts)
      Snacks.toggle({
        name = "Render Markdown",
        get = function()
          return require("render-markdown.state").enabled
        end,
        set = function(enabled)
          local m = require("render-markdown")
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      }):map("<leader>um")
    end,
}