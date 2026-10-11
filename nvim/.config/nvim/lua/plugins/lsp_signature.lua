vim.pack.add({
	"https://github.com/ray-x/lsp_signature.nvim",
})

require("lsp_signature").setup({
	bind = true,
	floating_window = true,
	floating_window_above_cur_line = true,
	hint_enable = false, -- Set to true if you want inline virtual text hints alongside the float
	handler_opts = {
		border = "rounded",
	},
	-- Tweak these if the popup is too aggressive
	toggle_key = "<M-x>", -- Press Alt-x to toggle the signature on/off
})
