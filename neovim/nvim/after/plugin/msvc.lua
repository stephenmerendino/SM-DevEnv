vim.api.nvim_create_autocmd("FileType", {
    pattern = {"cpp", "cxx", "cc", "h", "hpp"},  -- add extensions as needed
    callback = function()
        vim.bo.makeprg = "build.bat"
        vim.bo.errorformat = "%f:%l:%c: %m"
    end,
})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = { "[^l]*" },
    callback = function()
        vim.cmd("cwindow")
    end,
})

vim.opt.shell = 'cmd.exe'
vim.opt.shellcmdflag = '/c'
vim.opt.shellpipe = '>%s 2>&1'
vim.opt.shellredir = '>%s 2>&1'
