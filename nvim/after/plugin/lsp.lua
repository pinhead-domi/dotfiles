local on_attach = function(_, bufnr)
	local bufmap = function(keys, func, description)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = description })
	end

	bufmap('<leader>r', vim.lsp.buf.rename, '')
	bufmap('<leader>a', vim.lsp.buf.code_action, 'Code [a]ction')
	bufmap('<leader>cf', vim.lsp.buf.format, '[c]ode [f]ormat')

	bufmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
	bufmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
	bufmap('gI', vim.lsp.buf.implementation, '[g]oto [I]mplementation')
	bufmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

	bufmap('gr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')
	bufmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[d]ocument [s]ymbols')
	bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace [S]ymbols')

	bufmap('K', vim.lsp.buf.hover, 'Hover documentation')

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, {})
end

vim.g.rustaceanvim={
	server = {
		on_attach = on_attach
	}
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- no mason
-- require('lspconfig').lua_ls.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     Lua = {
--       workspace = { checkThirdParty = false },
--       telemetry = { enable = false },
--     },
-- }
require('lspconfig').gleam.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

-- mason
require("mason").setup()
require("mason-lspconfig").setup_handlers({

	function(server_name)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities
		}
	end,

	["lua_ls"] = function()
		require('neodev').setup()
		require('lspconfig').lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			}
		}
	end

	-- another example
	-- ["omnisharp"] = function()
	--     require('lspconfig').omnisharp.setup {
	--         filetypes = { "cs", "vb" },
	--         root_dir = require('lspconfig').util.root_pattern("*.csproj", "*.sln"),
	--         on_attach = on_attach,
	--         capabilities = capabilities,
	--         enable_roslyn_analyzers = true,
	--         analyze_open_documents_only = true,
	--         enable_import_completion = true,
	--     }
	-- end,
})
