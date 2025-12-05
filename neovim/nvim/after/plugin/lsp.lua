local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Lua
vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
  capabilities=cmp_capabilities
})
vim.lsp.enable('luals')

-- C/C++
--vim.lsp.config('cppls', {
--  cmd = {'clangd'},
--  filetypes = {'c', 'cpp', 'cxx'},
--  root_markers = {'compile_commands.json'},
--  capabilities=cmp_capabilities
--})
vim.lsp.enable('clangd')
