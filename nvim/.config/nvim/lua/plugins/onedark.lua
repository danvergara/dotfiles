vim.pack.add({
  'https://github.com/navarasu/onedark.nvim',
})

require('onedark').setup({
    -- Choose from: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
    style = 'darker',
    transparent = false,
    term_colors = true,

    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'bold',
        strings = 'none',
        variables = 'none'
    },

    -- Highlighting Integrations
    diagnostics = {
        darker = true,     -- Darker background for diagnostic lines
        undercurl = true,   -- Use undercurl for diagnostics
        background = true,  -- Use background color for virtual text
    },
})

vim.cmd.colorscheme('onedark')
