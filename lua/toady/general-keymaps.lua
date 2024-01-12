local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better insert to normal mode
map("i", "jj", "<Esc>", opts)
map("i", "kk", "<Esc>", opts)

-- enter and delete lines
map("n", "<Enter>", "o<Esc>", opts)
map("n", "<S-Enter>", "O<Esc>", opts)
map("n", "<BS>", "i<BS><Esc>", opts)
map("n", "<Del>", "i<Del><Esc>", opts)

-- move selected lines
map("v", "<C-j>", "<Esc>:m .+1<CR>==gi", opts)
map("v", "<C-k>", "<Esc>:m .-2<CR>==gi", opts)
map("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)

-- indentation
map("n", ">>", "<Nop>", opts)
map("n", ">>", "<Nop>", opts)
map("v", "<<", "<Nop>", opts)
map("v", "<<", "<Nop>", opts)

map("n", "<Tab>", ">>", opts)
map("n", "<S-Tab>", "<<", opts)
map("v", "<Tab>", ">><Esc>gv", opts)
map("v", "<S-Tab>", "<<<Esc>gv", opts)

-- caps are annoyings

map("n", "H", "<Nop>", opts)
map("n", "H", "h", opts)
map("n", "J", "<Nop>", opts)
map("n", "J", "j", opts)
map("n", "K", "<Nop>", opts)
map("n", "K", "k", opts)
map("n", "L", "<Nop>", opts)
map("n", "L", "l", opts)

-- save and quitting files
map("n", "<C-s>", ":FormatWrite<CR>:w<CR>", opts)
map("i", "<C-s>", "<Esc>:FormatWrite<CR>:w<CR>i", opts)

map("n", "<C-q>", ":FormatWrite<CR>:wq<CR>", opts)

-- shoutout
map("n", "<leader>s", ":so<CR>", opts)

-- aliases
vim.cmd([[
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("W","w")
call SetupCommandAlias("Q","q")
call SetupCommandAlias("Wq","wq")
call SetupCommandAlias("wQ","wq")
call SetupCommandAlias("WQ","wq")
]])
