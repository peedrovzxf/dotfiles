vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("plugins")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.textwidth = 0

vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_liststyle = 3
vim.opt.termguicolors = true
vim.cmd("colorscheme retrobox")

require('telescope').setup{
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
  },
}

require("mappings")
require("lsp")
