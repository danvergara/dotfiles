vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/saghen/blink.cmp",
})

-- =====================================================================
-- AUTOCOMPLETION (blink.cmp)
-- =====================================================================
require("blink.cmp").setup({
	-- 1. NvChad Muscle Memory Keymaps
	keymap = {
		preset = "none", -- Disable defaults so we can strictly control it
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
	},

	-- 2. Visuals and Icons
	appearance = {
		-- This tells Blink to automatically hook into nvim-web-devicons
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	-- 3. The UI (Borders and Menus)
	completion = {
		menu = {
			-- 'none' creates the flat NvChad look. Change to 'single' if you want a border.
			border = "none",
			draw = {
				-- Formats the dropdown to look exactly like NvChad (Icon + Text + Source)
				columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
		documentation = {
			window = { border = "single" },
			auto_show = true, -- Automatically show function signatures/docs
			auto_show_delay_ms = 250, -- Pop up quickly
		},
	},

	-- 4. Where the suggestions come from
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
})

-- Grab the advanced capabilities from Blink
local capabilities = require("blink.cmp").get_lsp_capabilities()
