-- [[ SPECIAL COMMANDS ]] --
vim.cmd("filetype indent on") -- filetype specific indenting
vim.cmd("display+=lastline") -- try to always show last line of the paragraph
vim.cmd("autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2")
vim.cmd("autocmd BufRead,BufNewFile *.js,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2")

-- config options taken from: https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/ --
local options = {
	-- [[ INDENTING OPTIONS ]] --
	autoindent = true, -- inherit indenting of past line in new line
	expandtab = true, -- convert tab to spaces
	shiftwidth = 4, -- indent using 4 spaces when shifting
	shiftround = true, -- round indentation to nearest "shiftwidth"
	tabstop = 4, -- indent using 4 spaces
	smarttab = true, -- insert "tabstop" number of spaces on "tab" press
	breakindent = true, -- line gets visually indented

	-- [[ SEARCH OPTIONS ]] --
	hlsearch = true, -- enable search highlighting
	ignorecase = true, -- ignore case while searching
	incsearch = true, -- increamental search that also shows partial matches
	smartcase = true, -- switch to case sensitive when uppercase charcter is added

	-- [[ PERFORMANCE OPTIONS ]] --
	timeoutlen = 500, -- time to wait for a mapped sequence (in ms)
	updatetime = 300, -- faster completion (4000ms by default)
	writebackup = false, -- stop a file from being edited if it is open elsewhere
	backup = false, -- creates a backup of the file on write
	undofile = true, -- enable persistent undo
	lazyredraw = true, -- dont update screen during macro and script execution

	-- [[ TEXT RENDERING OPTIONS ]] --
	encoding = "utf-8", -- set utf-8 as default text encoding mode
	linebreak = true, -- avoid wrapping in the middle of the word
	wrap = true, -- enable line wrapping
	scrolloff = 8, -- amount of lines before the cursor
	sidescrolloff = 5, -- no. of screen columns to keep beside the cursor

	-- [[ UI OPTIONS ]] --
	showmode = false, -- doesnt show mode info
	cmdheight = 2, -- sets height of the nvim command line
	pumheight = 10, -- sets height of pop up menu
	laststatus = 2, -- always show status bar
	ruler = true, -- always show cursor
	wildmenu = true, -- display command lines tab complete options as menu
	cursorline = true, -- highlight line under cursor
	number = true, -- set line number
	relativenumber = true, -- sets relative number on
	numberwidth = 4, -- set number column widht
	signcolumn = "yes", -- always show sign column
	errorbells = false, -- disable beep errors
	visualbell = true, -- flash screen on error
	mouse = "a", -- enable scrolling with mouse
	title = true, -- set title of screen
	termguicolors = true, -- enable colourschemes
	foldmethod = "indent", -- fold based on indent levels
	foldnestmax = 3, -- only fold upto 3 levels
	foldenable = false, -- turn off code folding by default
}

vim.opt.shortmess:append("c")
for k, v in pairs(options) do
	vim.opt[k] = v
end
