local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s("template", fmta([[
  \documentclass[<>]{<>}
  \usepackage[utf8]{inputenc}
  \usepackage[T1]{fontenc}
  \usepackage{amsmath}
  \usepackage{amsfonts}
  \usepackage{amssymb}
  \usepackage{graphicx}
  \usepackage{hyperref}

  \title{<>}
  \author{<>}
  \date{<>}

  \begin{document}
  \maketitle

  <>

  \end{document}
  ]], {
    c(1, {t("11pt"), t("12pt"), t("10pt")}),
    c(2, {t("article"), t("report"), t("book"), t("letter")}),
    i(3, "Title"),
    i(4, "Author"),
    i(5, "\\today"),
    i(0)
  })),

  s("sec", fmta([[\section{<>}
  <>]], {i(1, "Section"), i(0)})),
  
  s("sub", fmta([[\subsection{<>}
  <>]], {i(1, "Subsection"), i(0)})),
  
  s("ssub", fmta([[\subsubsection{<>}
  <>]], {i(1, "Subsubsection"), i(0)})),

  s("beg", fmta([[\begin{<>}
  <>
  \end{<>}]], {i(1), i(0), rep(1)})),
}
