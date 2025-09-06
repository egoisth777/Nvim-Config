-- Snippet loader utility
local M = {}

function M.load_snippets(filetype, snippet_dir)
  local luasnip = require("luasnip")
  local snippet_path = vim.fn.stdpath("config") .. "/Snippets/" .. filetype
  
  -- Check if the directory exists
  if vim.fn.isdirectory(snippet_path) == 0 then
    return
  end
  
  -- Get all lua files in the snippet directory
  local snippet_files = vim.fn.glob(snippet_path .. "/*.lua", false, true)
  
  local all_snippets = {}
  
  for _, file in ipairs(snippet_files) do
    local success, snippets = pcall(dofile, file)
    if success and type(snippets) == "table" then
      vim.list_extend(all_snippets, snippets)
    else
      vim.notify("Failed to load snippets from: " .. file, vim.log.levels.WARN)
    end
  end
  
  if #all_snippets > 0 then
    luasnip.add_snippets(filetype, all_snippets)
  end
end

function M.load_all_snippets()
  -- Load tex snippets
  M.load_snippets("tex")
  
  -- Add more filetypes as needed
  -- M.load_snippets("markdown")
  -- M.load_snippets("python")
end

return M
