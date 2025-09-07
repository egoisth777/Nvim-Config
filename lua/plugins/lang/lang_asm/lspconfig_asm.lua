return {

  -- ensure install the asm-lsp language server
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "asm-lsp",
      },
    },
    },
  -- mason-lsp-config
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
  },

  -- Configure asm-lsp server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        asm_lsp = {
          cmd = { "asm-lsp" },
          filetypes = { "asm", "s", "S", "masm" },
          root_dir = function(fname)
            return require("lspconfig.util").find_git_ancestor(fname) or vim.fn.getcwd()
          end,
          settings = {
            ["asm-lsp"] = {
              -- Enable diagnostics
              diagnostics = true,
              -- Set assembler to support MASM syntax
              assembler = "masm",
              -- Set instruction set for x86/x86-64
              instruction_set = "x86/x86-64",
              -- Enable hover documentation for opcodes
              hover = {
                enable = true,
                show_instruction_docs = true,
              },
            },
          },
          on_attach = function(client, bufnr)
            -- Enable hover on 'K' key
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, 
              { buffer = bufnr, desc = "Show opcode documentation" })
            
            -- Additional keymaps for LSP features
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, 
              { buffer = bufnr, desc = "Go to definition" })
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, 
              { buffer = bufnr, desc = "Find references" })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, 
              { buffer = bufnr, desc = "Code actions" })
            
            -- Enable signature help
            if client.server_capabilities.signatureHelpProvider then
              vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, 
                { buffer = bufnr, desc = "Signature help" })
            end
          end,
        },
      },
    },
  },
}
