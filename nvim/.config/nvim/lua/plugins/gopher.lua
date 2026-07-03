vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/olexsmir/gopher.nvim",
})

require("gopher").setup({
	commands = {
		go = "go",
		gomodifytags = "gomodifytags",
		impl = "impl",
		iferr = "iferr",
	},
})
