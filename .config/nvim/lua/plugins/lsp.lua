local M = {
	--- Uncomment the two plugins below if you want to manage the language servers from neovim
	--- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		config = function()
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			-- see :help lsp-zero-guide:integrate-with-mason-nvim
			-- to learn how to use mason.nvim with lsp-zero
			require('mason').setup({})
			require('mason-lspconfig').setup({
				handlers = {
					lsp_zero.default_setup,
				}
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			vim.diagnostic.config({
				virtual_text = false, -- stuff is displayed in hover window, c.f. below
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = false,
			})
			local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = bufnr,
				callback = function()
					local opts = {
						focusable = false,
						close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
						border = 'rounded',
						source = 'always',
						prefix = ' ',
						scope = 'cursor',
					}
					vim.diagnostic.open_float(nil, opts)
				end
			})
		end
	},
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				sources = {
					{ name = 'nvim_lsp' },
					{ name = "codeium" }
				},

				-- requires lspkind
				-- formatting = {
				--     format = require('lspkind').cmp_format({
				--         mode = "symbol",
				--         maxwidth = 50,
				--         ellipsis_char = '...',
				--         symbol_map = { Codeium = "", }
				--     })
				-- },
				-- mapping = {
				--     ["<Tab>"] = cmp.mapping(function(fallback)
				--         if cmp.visible() then
				--             local entry = cmp.get_selected_entry()
				--             if not entry then
				--                 cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				--             end
				--             cmp.confirm()
				--         else
				--             fallback()
				--         end
				--     end, { "i", "s" })
				-- },
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true })
				})
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})
		end
	},
	{ 'L3MON4D3/LuaSnip' },
}

return M
