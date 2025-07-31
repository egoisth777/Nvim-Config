-- Assembly related (MASM, NASM, GAS)
vim.filetype.add({
  extension = {
    asm = "nasm",
    s = "nasm", 
    S = "nasm",
    masm = "nasm",  -- MASM specific
    inc = "nasm",   -- MASM include files
  },
})

vim.filetype.add({
  extension = {
    tpp = "cpp", 
    tpl = "cpp", 
  }
})
-- Python LSP Configuration
-- Set to "pyrefly" to use pyrefly (default)
-- Set to "pyright" to use pyright
-- Set to "basedpyright" to use basedpyright
vim.g.lazyvim_python_lsp = "pyrefly"

-- Set to "ruff" to use ruff (default)
-- Set to "ruff_lsp" to use the old LSP implementation
vim.g.lazyvim_python_ruff = "ruff"