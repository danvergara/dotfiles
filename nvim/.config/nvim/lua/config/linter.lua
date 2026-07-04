-- =====================================================================
-- NVCHAD-STYLE DIAGNOSTICS UI
-- Configure how Neovim displays errors and warnings natively
-- =====================================================================
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- The classic NvChad dot before inline errors
		spacing = 4,
	},
	signs = true,
	underline = true,
	update_in_insert = false, -- Don't yell at you while you are actively typing
	float = {
		border = "rounded",
		source = true,
	},
})
