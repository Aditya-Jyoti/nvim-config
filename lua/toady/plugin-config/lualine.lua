local colors = {
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",

	surface0 = "#313244",
	surface1 = "#45475a",
	surface2 = "#585b70",

	overlay0 = "#6c7086",
	overlay1 = "#7f849c",
	overlay2 = "#9399b2",

	text = "#cdd6f4",
	subtext0 = "#a6adc8",
	subtext1 = "#bac2de",

	lavender = "#bfbefe",
	blue = "#89b4fa",
	sapphire = "#74c7ec",
	sky = "#89dceb",
	teal = "#94e2d5",
	green = "#a6e3a1",
	yellow = "#f9e2af",
	peach = "#fab387",
	maroon = "#eba0ac",
	red = "#f38ba8",
	mauve = "#cba6f7",
	pink = "#f5c2e7",
	flamingo = "#f2cdcd",
	rosewater = "#f5e0dc",
}

local catppuccin_theme = {
	normal = {
		a = { fg = colors.crust, bg = colors.flamingo },
		b = { fg = colors.crust, bg = colors.surface0 },
		c = { fg = colors.black, bg = colors.base },
		x = { fg = colors.text, bg = colors.base },
		y = { fg = colors.text, bg = colors.surface0 },
		z = { fg = colors.crust, bg = colors.mauve },
	},

	insert = {
		a = { fg = colors.crust, bg = colors.green },
		b = { fg = colors.crust, bg = colors.surface0 },
		c = { fg = colors.black, bg = colors.base },
		x = { fg = colors.text, bg = colors.base },
		y = { fg = colors.text, bg = colors.surface0 },
		z = { fg = colors.crust, bg = colors.mauve },
	},

	visual = {
		a = { fg = colors.crust, bg = colors.sky },
		b = { fg = colors.crust, bg = colors.surface0 },
		c = { fg = colors.black, bg = colors.base },
		x = { fg = colors.text, bg = colors.base },
		y = { fg = colors.text, bg = colors.surface0 },
		z = { fg = colors.crust, bg = colors.mauve },
	},

	replace = { a = { fg = colors.crust, bg = colors.red } },

	inactive = {
		a = { fg = colors.crust, bg = colors.crust },
		b = { fg = colors.crust, bg = colors.crust },
		c = { fg = colors.crust, bg = colors.crust },
		x = { fg = colors.crust, bg = colors.crust },
		y = { fg = colors.crust, bg = colors.crust },
		z = { fg = colors.crust, bg = colors.crust },
	},
}

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "hint" },
	symbols = { error = " ", warn = " ", hint = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local mode = {
	"mode",
	fmt = function(str)
		if str == "V-LINE" then
			return "X"
		end
		return string.sub(str, 1, 1)
	end,
}

local filename = function()
	return vim.fn.expand("%:t")
end

local filetype = {
	"filetype",
	icons_enabled = true,
}

local curr_line = function()
	return vim.fn.line(".")
end

local total_lines = function()
	return vim.fn.line("$")
end

-- selection count
local function selectionCount()
	local isVisualMode = vim.fn.mode():find("[Vv]")
	if not isVisualMode then
		return ""
	end
	local starts = vim.fn.line("v")
	local ends = vim.fn.line(".")
	local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
	return tostring(lines) .. "L " .. tostring(vim.fn.wordcount().visual_chars) .. "C"
end

-- harpoon
local function harpooned()
	if vim.api.nvim_buf_get_option(0, "buftype") ~= "" then
		return ""
	end

	local tabela = require("harpoon").get_mark_config()["marks"]

	local currentFile = vim.fn.split(vim.api.nvim_buf_get_name(0), "/")
	currentFile = currentFile[#currentFile]

	for _, value in pairs(tabela) do
		local file = vim.fn.split(value["filename"], "/")
		file = file[#file]
		if file == currentFile then
			return "󰃀"
		end
	end
	return "󰃃"
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = catppuccin_theme,
		component_separators = "",
		section_separators = { left = "", right = "" },

		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode, selectionCount },
		lualine_b = { diagnostics },
		lualine_c = { "branch", "diff" },
		lualine_x = { "encoding" },
		lualine_y = { filetype },
		lualine_z = { filename, harpooned },
	},
	tabline = {},
	extensions = {},
})
