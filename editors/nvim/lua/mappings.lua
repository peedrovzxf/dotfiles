vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", "<Cmd>tabnew<CR>")
vim.keymap.set('n', 'q', '<Nop>', { noremap = true, silent = true })

vim.keymap.set("n", "<C-n>", ":Telescope colorscheme<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("n", "<leader>da", function()
    if require("oil").get_current_dir() then
        vim.cmd("bd")
    else
        vim.cmd("Oil")
    end
end)
vim.keymap.set("n", "<leader>dd", function()
    if require("oil").get_current_dir() then
        vim.cmd("bd")
    else
        vim.cmd("Oil")
    end
end)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files)
vim.keymap.set('n', '<space>fn', function()
    builtin.find_files({
        no_ignore = true,
        hidden = true
    })
end)
vim.keymap.set('n', '<space>fg', builtin.live_grep)
vim.keymap.set('n', '<space>fb', builtin.buffers)
vim.keymap.set('n', '<space>fh', builtin.help_tags)
vim.keymap.set('n', '<space>en', function()
    builtin.find_files {
        cwd = vim.fn.stdpath("config")
    }
end)
vim.keymap.set('n', '<space>mk', builtin.marks)

vim.keymap.set("n", "<leader>src", ":source %<CR>")
vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>sw', builtin.lsp_workspace_symbols)
vim.keymap.set('n', '<space>dof', vim.diagnostic.open_float)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>fmt', function()
    vim.lsp.buf.format({
        async = true
    })
end, {})
vim.keymap.set("n", "<leader>p", "<Cmd>bprevious<CR>")
vim.keymap.set("n", "<leader>n", "<Cmd>bNext<CR>")
vim.keymap.set("n", "<leader>x", "<Cmd>bd<CR>")

vim.keymap.set('n', 'Y', ':%y+<CR>')

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<A-Left>', ':vertical resize -5<CR>')
vim.keymap.set('n', '<A-Right>', ':vertical resize +5<CR>')
