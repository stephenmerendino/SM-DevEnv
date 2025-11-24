local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
  capabilities=cmp_capabilities
})
vim.lsp.enable('luals')

vim.lsp.enable('clangd')
