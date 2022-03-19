local opt = vim.opt
local cmd = vim.api.nvim_command

opt.compatible = false
opt.syntax = "ON"
opt.showcmd = true
opt.termguicolors = true
opt.smartcase = true
opt.wrap = false
opt.showmode = false
opt.number = true
opt.cursorline = true
opt.backspace = {'indent', 'eol', 'start'}
opt.hidden = true
opt.foldmethod = "syntax"
opt.foldlevelstart = 99
opt.lazyredraw = true
opt.mouse = "a"
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.clipboard = "unnamed"
opt.swapfile = true
opt.splitright = true
opt.splitbelow = true
opt.signcolumn = "yes"
opt.guifont = "VictorMono Nerd Font"

cmd[[colorscheme dracula]]
cmd[[filetype off]]

function relativeln(target)
    if vim.b.lnstatus == nil then
        vim.b.lnstatus = "number"
    end

    if vim.b.lnstatus ~= "nonumber" then
        if target == "number" then
            vim.o.number = true
            vim.o.relativenumber = false
        else
            vim.o.number = true
            vim.o.relativenumber = true
        end
    else
        vim.o.number = false
    end
end

cmd[[autocmd InsertEnter * :lua relativeln("number")]]
cmd[[autocmd InsertLeave * :lua relativeln("relativenumber")]]
cmd[[autocmd FocusLost * :lua relativeln("number")]]
cmd[[autocmd CursorMoved * :lua relativeln("relativenumber")]]
