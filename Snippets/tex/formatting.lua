local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s("textbf", fmta([[\textbf{<>}]], {i(0)})),
  s("textit", fmta([[\textit{<>}]], {i(0)})),
  s("emph", fmta([[\emph{<>}]], {i(0)})),

  s("ref", fmta([[\ref{<>}]], {i(0)})),
  s("cite", fmta([[\cite{<>}]], {i(0)})),
  s("label", fmta([[\label{<>}]], {i(0)})),
}
