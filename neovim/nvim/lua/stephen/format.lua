vim.api.nvim_create_autocmd("FileType", {
    group = autogroup,
    pattern = "*",
    callback = function()
        -- We never want the following options
        vim.opt_local.formatoptions:remove({
            -- Auto-wrap text using 'textwidth'
            "t",
            -- Auto-wrap comments using 'textwidth', inserting the current comment leader automatically.
            "c",
            -- Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
            "o",
            -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
            "r",
        })
    end,
})

-- Convert snake case to camel case
vim.keymap.set("n", "<leader>r", function()
  vim.cmd([[silent! s#_\(\l\)#\u\1#g]])
  vim.cmd([[silent! s#_##g]])
end)

