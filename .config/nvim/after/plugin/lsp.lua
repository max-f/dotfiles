local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
	'rust_analyzer',
	'pylsp',
	'kotlin_language_server',
	'bashls',
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
