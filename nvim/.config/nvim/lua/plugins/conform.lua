vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	formatters_by_ft = {
		go = { "gofmt" },
		lua = { "stylua" },
		json = { "jq" },
		yaml = { "yamlfmt" },
	},

	-- Set up auto-formatting on save
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback", -- If a dedicated formatter isn't found, fall back to gopls or the native LSP
	},
})
