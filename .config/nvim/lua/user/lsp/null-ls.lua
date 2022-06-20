local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {
		formatting.prettier.with({
			extra_args = { "--single-quote", "--jsx-single-quote", "--bracket-same-line", "--indent_size: 1" },
		}), -- js, html, etc. formatter
		formatting.black.with({ extra_args = { "--fast" } }), -- python formatter
		formatting.stylua,
		formatting.prismaFmt,
		diagnostic.hadolint, -- dockerfile
		-- diagnostic.eslint,
	},
})
