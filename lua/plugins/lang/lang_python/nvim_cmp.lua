return
{
  "hrsh7th/nvim-cmp",
  optional = true,
  opts = function(_, opts)
    opts.auto_brackets = opts.auto_brackets or {}
    table.insert(opts.auto_brackets, "python")
  end,
}