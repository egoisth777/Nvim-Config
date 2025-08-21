-- Setting up CMake-Tools: https://github.com/Civitasv/cmake-tools.nvim/tree/master
-- A powerful plugins to 
-- 1. Automate generating CMake project files
-- 2. Set up kits for developmemt

return
{
  "Civitasv/cmake-tools.nvim",
  lazy = true,
 
  -- do/ Things for setting up at initialization
  init = function()
    local loaded = false
    local function check()
      local cwd = vim.uv.cwd()
      if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
        require("lazy").load({ plugins = { "cmake-tools.nvim" } })
        loaded = true
      end
    end
    check()
    vim.api.nvim_create_autocmd("DirChanged", { 
      callback = function()
        if not loaded then
          check()
        end
      end,
    })
  end,
  -- END ------------------------------------------------------------------------------
  
  -- bc/ LSP needs (Clangd) this to understand the libs and structures
  -- do/ Export compile_commands.json everytime when CMake configure the projects
  cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" },
  -- END ------------------------------------------------------------------------------

  
  -- do/ Configure the name of build directory
  cmake_build_directory = function()
    if vim.fn.has("win32") == 1 then
        return "nvim-cmake-build\\${variant:buildType}"
    end
    return "nvim-cmake-build/${variant:buildType}"
  end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a strings}
  -- END ------------------------------------------------------------------------------
  
  opts = {},
} 
