vim.pack.add({
	"https://github.com/chrisgrieser/nvim-lsp-endhints",
})

require("lsp-endhints").setup({
	autoEnableHints = true,
	icons = {
		type = "󰜁 ",
		parameter = "󰏪 ",
		offspec = " ", -- hint kind not defined in official LSP spec
		unknown = " ", -- hint kind is nil
	},
	label = {
		padding = 1,
		marginLeft = 0,
		sameKindSeparator = ", ",
		empty = "",
	},
	extmark = {
		priority = 50,
	},
})
