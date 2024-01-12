local fn = vim.fn

------------
-- Packer --
------------

-- auto installs packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- check if packer is installed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- make packer use a pop up window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

----------------------
-- External Plugins --
----------------------

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("alvan/vim-closetag") -- Autoclose (x)html tags
	use("windwp/nvim-ts-autotag") -- Autoclose tags
	use("Raimondi/delimitMate") -- Auto closing brackets and quotes
	use("nvim-tree/nvim-web-devicons") -- Icons and colours
	use("nvim-tree/nvim-tree.lua") -- File tree manager
	use("nvim-lualine/lualine.nvim") -- Status line
	use("lewis6991/impatient.nvim") -- Improve lua plugin load time
	use("HiPhish/nvim-ts-rainbow2") -- Rainbow brackets
	use("rhysd/vim-clang-format") -- Clang formatter
	use("junegunn/fzf.vim") -- FZF integration
	use("tpope/vim-commentary") -- Better commenting
	use("terryma/vim-multiple-cursors") -- Multi cursors
	use("mbbill/undotree") -- Undotree
	use("rafamadriz/friendly-snippets") -- Snippets
	use("mhartington/formatter.nvim") -- Formatter

	use({
		"kndndrj/nvim-dbee",
		requires = {
			"MunifTanjim/nui.nvim",
		},
		run = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup(--[[optional config]])
		end,
	})

	use({
		"folke/noice.nvim",
		requires = "MunifTanjim/nui.nvim",
	})

	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({})
		end,
	})

	use({
		"ThePrimeagen/harpoon",
		requires = "nvim-lua/plenary.nvim",
	}) -- File traversing

	use({ "catppuccin/nvim", as = "catppuccin" }) -- Theme

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
	}) -- LSP

	use({ "junegunn/fzf", run = ":call fzf#install()" }) -- FZF itself

	use({ -- treesitter
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
