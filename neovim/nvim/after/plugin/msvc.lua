vim.api.nvim_create_autocmd("FileType", {
    pattern = {"cpp", "cxx", "cc", "c"},  -- add extensions as needed
    callback = function()
        local fname = vim.api.nvim_buf_get_name(0)
        local fdir = vim.fn.fnamemodify(fname, ":p:h")
        local dir = fdir        

        -- Function to join paths (since Windows uses \ while Neovim prefers /)
        local function join_path(...)
            return table.concat({...}, package.config:sub(1,1))
        end

        -- Upward search for build.bat
        local buildbat = nil
        while dir and dir ~= "" do
            local candidate = join_path(dir, "build.bat")
            if vim.fn.filereadable(candidate) == 1 then
                buildbat = candidate
                break
            end
            local parent = vim.fn.fnamemodify(dir, ":h")
            if parent == dir then break end  -- at root
            dir = parent
        end

        if buildbat then
            vim.bo.makeprg = '"' .. buildbat .. '"'
        else
            local filename = vim.fn.expand('%:t')
            local basename = vim.fn.fnamemodify(filename, ":r")
            local builddir = join_path(fdir, "Build")
            local exe_path = join_path(builddir, basename .. ".exe")
            local pdb_path = join_path(builddir, basename .. ".pdb")
            local obj_path = join_path(builddir, basename .. ".obj")
            vim.bo.makeprg = table.concat({
                'mkdir "' .. builddir .. '" >nul 2>&1',
                'cl.exe /nologo /EHsc /Od /Zi ' ..
                '/Fe"' .. exe_path .. '" ' ..
                '/Fd"' .. pdb_path .. '" ' ..
                '/Fo"' .. obj_path .. '" "' .. fname .. '"'
            }, " & ")
        end

        vim.bo.errorformat = table.concat({
            '%f(%l): error C%n: %m',
            '%f(%l): fatal error C%n: %m',
            '%f(%l): warning C%n: %m'
        }, ',')
    end
})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = { "make" },
    callback = function()
        vim.cmd("cwindow")
    end,
})

vim.opt.shell = 'cmd.exe'
vim.opt.shellcmdflag = '/c'
vim.opt.shellpipe = '>%s 2>&1'
vim.opt.shellredir = '>%s 2>&1'
