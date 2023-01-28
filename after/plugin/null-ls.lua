local null_ls = require("null-ls")

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.prettier.with({
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
--		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.golines,
		null_ls.builtins.formatting.stylua,
		--        null_ls.builtins.diagnostics.eslint,
		--        null_ls.builtins.completion.spell,
	},
})
