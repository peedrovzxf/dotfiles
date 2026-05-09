vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("plugins")

vim.opt.number = true
vim.opt.guicursor = "n-v-i-c:block"
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.textwidth = 0
vim.opt.background = "dark"

vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_liststyle = 3
vim.opt.termguicolors = true
vim.cmd("colorscheme tokyodark")

require('telescope').setup{
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
  },
}

require("fidget").setup({
  progress = {
    display = {
      done_icon = "✔",
      progress_icon = { pattern = "dots", period = 1 },
    },
  },
  notification = {
    window = {
      winblend = 0,
      border = "none",
    },
  },
})

require("colorizer").setup()
require("oil").setup()

require("mappings")
require("lsp")
