local M = {
	"nvim-telescope/telescope.nvim",
	event = "BufReadPre",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
        {"nvim-lua/plenary.nvim"},
	},
	keys = {
		{
			"<C-M-p>",
			"<cmd>lua require('telescope.builtin').builtin(require('telescope.themes').get_dropdown({}))<cr>",
		},
	},
	opts = function()
		local actions = require("telescope.actions")
		local theme = require("telescope.themes")

        -- keymaps
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fu', builtin.lsp_references, {})

		return {
			pickers = {
				find_files = { hidden = true },
				live_grep = {
					additional_args = function(opts)
						return { "--hidden" }
					end,
				},
			},
			defaults = {
				mappings = { i = { ["<esc>"] = actions.close } },
			},

			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				["ui-select"] = {
					theme.get_dropdown({
						-- even more opts
					}),
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
}

return M
