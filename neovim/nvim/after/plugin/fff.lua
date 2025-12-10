local fff = require('fff')
fff.setup()

vim.keymap.set('n', '<leader>pf', function() fff.find_files() end, { desc = 'FFF find all files' })
vim.keymap.set('n', '<C-p>', function() fff.find_in_git_root() end, { desc = 'FFF find git files' })
