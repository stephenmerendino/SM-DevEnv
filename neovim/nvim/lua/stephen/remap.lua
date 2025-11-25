vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>")
-- vim.keymap.set("n", "<leader>pvv", "<cmd>:Lex ~/AppData/Local/nvim/<CR>")

-- Visual move code up and down
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the same place while pulling lines up
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor is good places while navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-U>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep clipboard buffer the same when pasting
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to system clipboard with leader
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")

vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>p", "\"+P")

-- Delete to void buffer to preserve clipboard
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Remap Ctrl+C to Esc so that vertical editing works right
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Prime says capital Q sucks
vim.keymap.set("n", "Q", "<nop>")

-- Formatting
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Bring up code action menu
vim.keymap.set("n", "<leader>qf", function()
    vim.lsp.buf.code_action()
end)

-- Switch between header/source files
vim.keymap.set("n", "<leader>o", "<cmd>ClangdSwitchSourceHeader<CR>")

-- C++ editing & building
vim.keymap.set("n", "<F5>", ":make<CR>", { noremap=true, silent=false})
vim.keymap.set('n', '<S-F5>', function()
  -- Build your command
  local exe = vim.fn.expand('%:p:h') .. '/Build/' .. vim.fn.expand('%:r') .. '.exe'
  vim.cmd('terminal "' .. exe .. '"')
end, { noremap=true, silent=true })
vim.keymap.set('n', '<F9>', ':copen<CR>', { noremap=true, silent=true })
