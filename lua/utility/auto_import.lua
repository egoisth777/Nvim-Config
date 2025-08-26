local M = {}

function M.auto_import_modules(base_module)
  local imports = {}
  -- Test Relative Path to be correct or not
 
  local config_path = vim.fn.stdpath("config")
  config_path = config_path:gsub("\\", "/") -- Might be MS-DOS Style Path

  local glob_path = config_path .. "/lua/" .. base_module:gsub("%.", "/") .. "/*.lua"
  
  -- GLOB all files under the glob_path
  local files = vim.fn.glob(glob_path, true, true)
  
  for _, file in ipairs(files) do 
    local normalized_file = file:gsub("\\", "/")
    
    -- bc| need file name to combine withExtract 
    -- do| get fileName part
    local fileName = normalized_file:match("([^/]+)%.lua$")
    
    -- bc| need sth {import "<rel_path to outmost init.lua>"}
    -- do| combine base_module + fileName to get current module    
    if fileName and fileName ~= "init" then
      local module_path = base_module .. "." .. fileName
      table.insert(imports, {import = module_path})
    end
    
  end
  
  return imports
end

return M

