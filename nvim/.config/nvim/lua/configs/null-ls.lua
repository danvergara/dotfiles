local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- This is mostly for formatting.
local opts = {
  sources = {
    -- Go
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.diagnostics.golangci_lint,
    -- JS/TS
    require "none-ls.diagnostics.eslint",
    -- Python
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    -- Lua
    null_ls.builtins.diagnostics.selene,
    null_ls.builtins.formatting.stylua,
    -- Protocol Buffer
    null_ls.builtins.diagnostics.buf,
    -- CPP
    null_ls.builtins.formatting.clang_format,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
return opts
