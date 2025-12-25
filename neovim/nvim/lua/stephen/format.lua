vim.api.nvim_create_autocmd("FileType", {
    pattern = {"*"},  -- add extensions as needed
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
            "r"
        })
    end,
})

vim.filetype.add({
    extension = {
        hlsl="hlsl",
        hlsli="hlsl",
        fxi="hlsl",
        fx="hlsl",
        dcx="lisp",
        dc="lisp"
    }
})
