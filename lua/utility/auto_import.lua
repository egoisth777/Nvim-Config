local M = {}


function M.auto_import_modules(base_dir)
  local imports = {} -- start with an empty local import array
  local glob_path = "lua/" .. base_dir:gsub("%.", "/") .. "/*.lua"
  local files = vim.fn.glob(glob_path, true, true)
  
  -- Find files
  for _, file in ipairs(files) do 
    local module_path = file:gsub("lua/", ""):gsub("%.lua$", ""):gsub("/", ".")
    
    if not module_path:match("%.init$") then
      -- Add each import spec to the end of the import array
      table.insert(imports, {import = module_path})
    end
  end
  
  return imports
  
end

return M

