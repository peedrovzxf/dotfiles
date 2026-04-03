require("plugins")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2  
vim.opt.shiftwidth = 2   
vim.opt.expandtab = true 
vim.opt.clipboard:append("unnamedplus")

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_liststyle = 3

require("mappings")
