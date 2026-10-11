vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/akinsho/bufferline.nvim",
})

-- =====================================================================
-- BUFFERLINE (Tabs UI)
-- =====================================================================
require("bufferline").setup({
	options = {
		mode = "buffers",
		-- Inherits colors perfectly from your OneDark theme
		themable = true,
		-- Clean up the UI
		numbers = "none",
		show_buffer_close_icons = false,
		show_close_icon = false,
		-- NvChad-style active indicator
		indicator = {
			icon = "▎",
			style = "icon",
		},
		-- Show LSP errors right inside the tab!
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, _, _)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		custom_filter = function(buf_number, _)
			local filetype = vim.bo[buf_number].filetype
			local buftype = vim.bo[buf_number].buftype

			-- Hide vim-fugitive buffers
			if filetype == "fugitive" or filetype == "fugitiveblame" then
				return false
			end

			-- Hide reference lists (Quickfix, Location List)
			if filetype == "qf" or buftype == "quickfix" then
				return false
			end

			-- Hide other common utility windows (Terminal, Trouble, Telescope)
			if buftype == "terminal" or buftype == "nofile" or filetype == "trouble" then
				return false
			end

			return true
		end,
		-- Visual tweaks
		modified_icon = "●",
		left_trunc_marker = "",
		right_trunc_marker = "",
		always_show_bufferline = true,
	},
})
