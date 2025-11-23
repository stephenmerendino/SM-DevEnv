local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug ('ellisonleao/gruvbox.nvim')
Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim', { ['tag']='v0.1.9' })
Plug ("nvim-treesitter/nvim-treesitter", { ['branch']='master', ['do']=':TSUpdate' })
Plug ('ThePrimeagen/harpoon')
Plug ('mbbill/undotree')
Plug ('tpope/vim-fugitive')
Plug ('nvim-tree/nvim-web-devicons')
Plug ('nvim-tree/nvim-tree.lua')

vim.call('plug#end')
