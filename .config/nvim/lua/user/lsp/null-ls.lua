local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics

null_ls.setup({
  debug = true,
  sources = {
    formatting.prettierd.with({
      extra_args = {
        "--semi",
        "--single-quote",
        "--jsx-single-quote",
        "--bracket-same-line",
        "--indent_size: 1",
      },
    }), -- js, html, etc. formatter
    formatting.black.with({ extra_args = { "--fast" } }), -- python formatter
    formatting.stylua,
    formatting.goimports,
    formatting.gofmt,
    formatting.golines,
    formatting.prismaFmt,
    diagnostic.hadolint, -- dockerfile
    -- diagnostic.eslint,
  },
})
