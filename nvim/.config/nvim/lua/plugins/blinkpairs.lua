vim.pack.add({
	"https://github.com/saghen/blink.lib",
	{ src = "https://github.com/saghen/blink.pairs", version = vim.version.range("*") },
})

-- download prebuilt binaries from github releases, must be on a versioned release
require("blink.pairs").download():pwait(60000)
-- OR build from source
-- require('blink.pairs').build():pwait(60000)

-- see above for the config
require("blink.pairs").setup({})
