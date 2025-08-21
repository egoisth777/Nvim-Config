return
{
  -- Setting up for nvim treesitter
  {
    "nvim-treesitter/nvim-treesitter", 
    opts = {
      ensured_installed = {"cmake"}
    }
  },
  -- Setting up for mason to ensured installing
  -- 1. cmakelang
  -- 2. cmakelint
  {
    "mason.nvim", 
    opts = {
      ensured_installed = {"cmakelang", "cmakelint"}
    },
  }
}


