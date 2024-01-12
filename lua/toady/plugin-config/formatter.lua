-- Utilities for creating configurations
local util = require("formatter.util")
local path = "formatter.filetypes."

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,

	filetype = {
		-- will be executed in order
		c = require(path .. "c").clangformat,
		cmake = require(path .. "cmake").cmakeformat,
		cpp = require(path .. "cpp").clangformat,
		cs = require(path .. "cs").clangformat,
		css = require(path .. "css").prettier,
		go = require(path .. "go").gofmt,
		html = require(path .. "html").prettier,
		java = require(path .. "java").clangformat,
		javascript = require(path .. "javascript").prettier,
		javascriptreact = require(path .. "javascriptreact").prettier,
		json = require(path .. "json").prettier,
		lua = require(path .. "lua").stylua,
		markdown = require(path .. "markdown").prettier,
		python = require(path .. "python").black,
		rust = require(path .. "rust").rustfmt,
		sh = require(path .. "sh").shfmt,
		sql = require(path .. "sql").pgformat,
		svelte = require(path .. "svelte").prettier,
		toml = require(path .. "toml").taplo,
		typescript = require(path .. "typescript").prettier,
		typescriptreact = require(path .. "typescriptreact").prettier,
		xhtml = require(path .. "xhtml").tidy,
		xml = require(path .. "xml").tidy,
		yaml = require(path .. "yaml").prettier,
		zsh = require(path .. "zsh").beautysh,

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = require(path .. "any").remove_trailing_whitespace,
	},
})
