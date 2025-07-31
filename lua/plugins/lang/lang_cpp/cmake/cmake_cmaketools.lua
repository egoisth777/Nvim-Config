-- Setting up CMake-Tools: https://github.com/Civitasv/cmake-tools.nvim/tree/master
-- A powerful plugins to 
-- 1. Automate generating CMake project files
-- 2. Set up kits for developmemt

return 
{
  "Civitasv/cmake-tools.nvim",
  lazy = true,
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
  opts = {},
}