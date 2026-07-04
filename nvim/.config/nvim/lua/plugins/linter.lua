vim.pack.add({
	"https://github.com/mfussenegger/nvim-lint",
})

local lint = require("lint")

lint.linters_by_ft = {
	go = { "golangcilint" },
	lua = { "luacheck" },
}

-- Create an autocommand to run the linter in the background
-- This triggers when save a file, open a file, or leave insert mode
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("NvimLint", { clear = true }),
	callback = function()
		lint.try_lint()
	end,
})
