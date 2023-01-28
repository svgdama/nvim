local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"tsserver",
	"gopls",
	"eslint",
	"sumneko_lua",
	"emmet_ls",
	"cssls",
})
-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.configure("gopls", {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	-- disable completion with tab
	-- this helps with copilot setup
	["<Tab>"] = nil,
	["<S-Tab>"] = nil,
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

-- set up formatting on save, you can use this as a callback
-- ref: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local add_format_on_save = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
				})
			end,
		})
	end
end

lsp.on_attach(function(client, bufnr)
	if client.name == "eslint" then
		vim.cmd.LspStop("eslint")
		return
	end

	add_format_on_save(client, bufnr)
	if client.name == "tsserver" or client.name == "gopls" then
		-- disable server formatting in favor of prettier
		-- client.server_capabilities.document_formatting = false
		client.server_capabilities.documentFormattingProvider = false
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
	--    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	--    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
end)

lsp.setup()
vim.diagnostic.config({
	virtual_text = true,
})
