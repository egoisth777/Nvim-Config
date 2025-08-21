local M = {}

function M.auto_import_modules(base_dir)
  local imports = {} -- Table that holds all imports
  -- 
  local glob_path = "lua/" .. base_dir:gsub("%.", "/") .. "/*.lua"
  local files = vim.fn.glob(glob_path, true, true)
  
  -- Find files
  for _, file in ipairs(files) do 
    local normalized_file = file:gsub("\\", "/") -- Path might be in the Windows Format
    local module_path = normalized_file:gsub("^lua/", ""):gsub("%.lua$", ""):gsub("/", ".")
    
    if not module_path:match("%.init$") then
      -- Add each import spec to the end of the import array
      table.insert(imports, {import = module_path})
    end
  end
  
  return imports
end

return M

