local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s("eq", fmta([[\begin{equation}
  <>
  \label{eq:<>}
  \end{equation}]], {i(1), i(0, "label")})),

  s("align", fmta([[\begin{align}
  <>
  \end{align}]], {i(0)})),

  s("frac", fmta([[\frac{<>}{<>}]], {i(1), i(2)})),

  s("sum", fmta([[\sum_{<>}^{<>} <>]], {i(1, "i=1"), i(2, "n"), i(0)})),

  s("int", fmta([[\int_{<>}^{<>} <> \, d<>]], {i(1), i(2), i(3), i(0, "x")})),

  s("lim", fmta([[\lim_{<> \to <>} <>]], {i(1, "x"), i(2, "\\infty"), i(0)})),

  s("mat", fmta([[\begin{<>matrix}
  <>
  \end{<>matrix}]], {
    c(1, {t(""), t("p"), t("b"), t("B"), t("v"), t("V")}),
    i(0),
    rep(1)
  })),
}
