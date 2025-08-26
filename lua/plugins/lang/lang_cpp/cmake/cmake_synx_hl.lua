return
{
  -- Setting up for nvim treesitter
  {
    "nvim-treesitter/nvim-treesitter", 
    opts = {
      ensure_installed = {"cmake"}
    }
  },
  -- Setting up for mason to ensure installing
  -- 1. cmakelang
  -- 2. cmakelint
  {
    "mason.nvim", 
    opts = {
      ensure_installed = {"cmakelang", "cmakelint"}
    },
  }
}


