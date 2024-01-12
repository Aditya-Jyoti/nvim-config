local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>b", ":Buffers<CR>", opts)
map("n", "<leader>f", ":Files<CR>", opts)
map("n", "<leader>gf", ":GFiles<CR>", opts)
map("n", "<leader>l", ":Lines<CR>", opts)
map("n", "<leader>m", ":Marks<CR>", opts)
map("n", "<leader>w", ":Rg<CR>", opts)
