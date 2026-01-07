-------------------------------------------------------------------------------
-- Lua
vim.lsp.config('lua_ls', {
    cmd = {'lua-language-server'},
    filetypes = {'lua'},
    root_markers = {'.luarc.json', '.luarc.jsonc'},
    capabilities=cmp_capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the server you're using Neovim (5.1 compatible)
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics= {
                globals = { 'vim' }
            },
            workspace = {
                library = {
                    -- Make the server aware of Neovim runtime files
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true,
                }
            },
        }
    }
})
vim.lsp.enable('lua_ls')

-------------------------------------------------------------------------------
-- C/C++
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('clangd', {
  cmd = {'clangd', "--query-driver=C:\\sdk\\prospero\\12.00.00.38\\host_tools\\bin\\prospero-clang.exe"},
  --cmd = {'clang-cl', "--query-driver=C:\\Program Files\\Microsoft Visual Studio\\2022\\Professional\\VC\\Tools\\Llvm\\x64\\bin\\clang-cl.exe"},
  filetypes = {'c', 'cpp', 'cxx'},
  root_markers = {'compile_commands.json'},
  capabilities=cmp_capabilities
})
vim.lsp.enable('clangd')

--vim.lsp.config("ccls", {
--    init_options = {
--        index = {
--            threads = 0;
--        };
--    }
--})
--vim.lsp.enable('ccls')

-------------------------------------------------------------------------------
-- Python
vim.lsp.enable('jedi_language_server')

-------------------------------------------------------------------------------
-- Slang (hlsl)
vim.lsp.config('slangd', {
    cmd = {
        'slangd'
    },
    root_markers = {'slangdconfig.json'}
})
vim.lsp.enable('slangd')
