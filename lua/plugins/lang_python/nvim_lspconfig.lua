return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
            },
          },
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },
        pyright = {},
        basedpyright = {},
      },
      setup = {
        ["ruff"] = function()
          LazyVim.lsp.on_attach(function(client, _)
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end, "ruff")
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Configure Python LSP servers
      local python_lsp = "pyright" -- or "basedpyright"
      local python_linter = "ruff" -- or "ruff_lsp"
      
      local servers = { "pyright", "basedpyright", "ruff", "ruff_lsp" }
      for _, server in ipairs(servers) do
        opts.servers[server] = opts.servers[server] or {}
        -- Enable only the selected LSP and linter
        opts.servers[server].enabled = server == python_lsp or server == python_linter
      end
    end,
  },
}