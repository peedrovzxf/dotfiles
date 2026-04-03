vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", function ()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end)
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("n", "<leader>E", function ()
  vim.cmd("Explore")
end)
vim.keymap.set("n", "<leader>da", function ()
  vim.cmd("Lexplore")
end)
vim.keymap.set("n", "<leader>dd", function ()
  vim.cmd("Lexplore %:p:h")
end)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', function()
    builtin.find_files({
        no_ignore = true,
        hidden = true
    })
end)
vim.keymap.set('n', '<space>fg', builtin.live_grep)
vim.keymap.set('n', '<space>fb', builtin.buffers)
vim.keymap.set('n', '<space>fh', builtin.help_tags)
vim.keymap.set('n', '<space>en', function ()
  builtin.find_files {
    cwd = vim.fn.stdpath("config")
  }
end)

