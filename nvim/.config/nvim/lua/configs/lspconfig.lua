-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- This is moslty for autocomplete and autosugestiongs.
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  gopls = {
    completeUnimported = true,
    usePlaceholders = true,
    analyses = {
      unusedparams = true,
    },
  },
}

local tf_capb = vim.lsp.protocol.make_client_capabilities()
tf_capb.textDocument.completion.completionItem.snippetSupport = true

lspconfig.terraformls.setup {
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
  capabilities = tf_capb,
}

local lspconfig = require "lspconfig"
lspconfig.pyright.setup {
  capabilities = capabilities,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
}

lspconfig.ruff.setup {}
