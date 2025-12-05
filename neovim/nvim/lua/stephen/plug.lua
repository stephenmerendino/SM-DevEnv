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
Plug ('mason-org/mason.nvim')
Plug ('neovim/nvim-lspconfig')
Plug ('windwp/nvim-autopairs')
Plug ('numToStr/Comment.nvim')
Plug ('kylechui/nvim-surround')
Plug ('nvim-lualine/lualine.nvim')
Plug ('stevearc/aerial.nvim')

--nvim-cmp
Plug ('hrsh7th/cmp-nvim-lsp')
Plug ('hrsh7th/cmp-buffer')
Plug ('hrsh7th/cmp-path')
Plug ('hrsh7th/cmp-cmdline')
Plug ('hrsh7th/nvim-cmp')
Plug ('hrsh7th/cmp-vsnip')
Plug ('hrsh7th/vim-vsnip')
Plug ('hrsh7th/cmp-nvim-lsp-signature-help')

vim.call('plug#end')
