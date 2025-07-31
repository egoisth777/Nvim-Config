-- This one setup the clangd extension for nvim
-- This plugin set up allows for
-- [[
-- Switch between Header/Source: Instantly jump between a .cpp file and its corresponding .h file. This is arguably the most valuable feature for C++ developers.
-- Inlay Hints: Display helpful information directly in your code, such as parameter names and type hints.
-- Type and Call Hierarchy: View the inheritance tree for a class or see all possible calls for a function.
-- Memory Usage: Show the memory layout and size of a class or struct.
-- ]]

return
{
  "p00f/clangd_extensions.nvim",
  lazy = true,
  config = function() end,
  opts = {
    inlay_hints = {
      inline = false,
    },
    ast = {
      --These require codicons (https://github.com/microsoft/vscode-codicons)
      role_icons = {
        type = "",
        declaration = "",
        expression = "",
        specifier = "",
        statement = "",
        ["template argument"] = "",
      },
      kind_icons = {
        Compound = "",
        Recovery = "",
        TranslationUnit = "",
        PackExpansion = "",
        TemplateTypeParm = "",
        TemplateTemplateParm = "",
        TemplateParamObject = "",
      },
    },
  },
}