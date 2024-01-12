local map = vim.keymap.set 
local opts = {noremap= true, silent= true}

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", "<leader>a", mark.add_file, opts)
map("n", "<leader>p", ui.toggle_quick_menu, opts)

map("n", "<leader>=", ui.nav_next, opts)
map("n", "<leader>-", ui.nav_prev, opts)

map("n", "<leader>1", function() ui.nav_file(1) end, opts)
map("n", "<leader>2", function() ui.nav_file(2) end, opts)
map("n", "<leader>3", function() ui.nav_file(3) end, opts)
map("n", "<leader>4", function() ui.nav_file(4) end, opts)
map("n", "<leader>5", function() ui.nav_file(5) end, opts)
map("n", "<leader>6", function() ui.nav_file(6) end, opts)
map("n", "<leader>7", function() ui.nav_file(7) end, opts)
map("n", "<leader>8", function() ui.nav_file(8) end, opts)
map("n", "<leader>9", function() ui.nav_file(9) end, opts)
