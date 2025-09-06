local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s("proof", fmta([[\begin{proof}
  <>
  \end{proof}]], {i(0)})),

  s("theorem", fmta([[\begin{theorem}
  <>
  \end{theorem}]], {i(0)})),

  s("lemma", fmta([[\begin{lemma}
  <>
  \end{lemma}]], {i(0)})),

  s("definition", fmta([[\begin{definition}
  <>
  \end{definition}]], {i(0)})),
}
