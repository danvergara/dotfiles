vim.pack.add({
	"https://github.com/brenoprata10/nvim-highlight-colors",
})

vim.opt.termguicolors = true

require("nvim-highlight-colors").setup({
	render = "virtual", -- Shows the colored block next to the hex code
	virtual_symbol = "■",
})
