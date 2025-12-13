require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up (Normal mode)"})
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down (Normal mode)" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up (Visual mode)"})
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down (Visual mode)"})
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Search and replace word under cursor"});
map("n", "Q", "<Nop>", { desc = "Disable explorer mode"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
