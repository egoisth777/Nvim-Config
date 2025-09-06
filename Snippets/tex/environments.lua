local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s("item", fmta([[\begin{itemize}
  \item <>
  \end{itemize}]], {i(0)})),

  s("enum", fmta([[\begin{enumerate}
  \item <>
  \end{enumerate}]], {i(0)})),

  s("fig", fmta([[\begin{figure}[<>]
  \centering
  \includegraphics[width=<>\textwidth]{<>}
  \caption{<>}
  \label{fig:<>}
  \end{figure}]], {
    c(1, {t("htbp"), t("h"), t("t"), t("b"), t("p")}),
    i(2, "0.8"),
    i(3, "path/to/image"),
    i(4, "Caption"),
    i(0, "label")
  })),

  s("tab", fmta([[\begin{table}[<>]
  \centering
  \begin{tabular}{<>}
  \hline
  <>
  \hline
  \end{tabular}
  \caption{<>}
  \label{tab:<>}
  \end{table}]], {
    c(1, {t("htbp"), t("h"), t("t"), t("b"), t("p")}),
    i(2, "c|c|c"),
    i(3, "Column 1 & Column 2 & Column 3 \\\\"),
    i(4, "Caption"),
    i(0, "label")
  })),
}
