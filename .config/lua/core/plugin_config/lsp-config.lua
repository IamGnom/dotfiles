require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {
		"awk_ls", "bashls", "clangd", "cssls", "dockerls", "html", "java_language_server",
		"jdtls", "jsonls", "lua_ls", "luau_lsp", "pyright", "rust_analyzer", "sqlls", "vimls",
		"yamlls",
	},
}

-- Setup language servers.
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

lspconfig.awk_ls.setup {}
lspconfig.bashls.setup {}
lspconfig.clangd.setup {}
lspconfig.cssls.setup {}
lspconfig.dockerls.setup {}
lspconfig.html.setup {}
lspconfig.java_language_server.setup {}
lspconfig.jdtls.setup {}
lspconfig.jsonls.setup {}
lspconfig.lua_ls.setup {}
lspconfig.luau_lsp.setup {}
lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
lspconfig.sqlls.setup {}
lspconfig.vimls.setup {}
lspconfig.yamlls.setup {}
