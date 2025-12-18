local telescope = require('telescope')
telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--no-config',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--type-add',
            'nd:*.{fxi,fx,dc,dcx}',
            '--type-add',
            'shaders:*.{hlsl,frag,vert}',
            '-tnd',
            '-tshaders',
            '-tlua',
            '-tcpp'
        }
    }
    -- rg --color=never --no-heading --with-filename --line-number --column --smart-case --type-add nd:*{fxi,fx,dc,dcx} -tnd -tlua -tcpp TTexture
    --extensions = {
    --    fzf = {
    --        fuzzy = true,                    -- false will only do exact matching
    --        override_generic_sorter = true,  -- override the generic sorter
    --        override_file_sorter = true,     -- override the file sorter
    --        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    --        -- the default case_mode is "smart_case"
    --    }
    --}
}

--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find all files' })
--vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
--vim.keymap.set('n', '<leader>ps', function()
--	builtin.live_grep({ search = vim.fn.input("Grep > ") })
--end)

vim.keymap.set('n', '<leader>ps', require('telescope.builtin').grep_string, {})
vim.keymap.set('v', '<leader>ps', function()
    -- yank visual selection to the "v" register without affecting default
    vim.cmd('normal! "vy')
    local text = vim.fn.getreg('v')
    if text == '' then
        return
    end
    require('telescope.builtin').live_grep({
        default_text = text,
    })
end, { desc = 'Live grep selection' })

vim.keymap.set('n', '<leader>pd', require('telescope.builtin').live_grep, {})
