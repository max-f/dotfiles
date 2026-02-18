local M = {
	{
	  "mikavilpas/yazi.nvim",
	  version = "*", -- use the latest stable version
	  event = "VeryLazy",
	  dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	  },
	  keys = {
		-- 👇 in this section, choose your own keymappings!
		{
		  "<leader>-",
		  mode = { "n", "v" },
		  "<cmd>Yazi<cr>",
		  desc = "Open yazi at the current file",
		},
		{
		  -- Open in the current working directory
		  "<leader>cw",
		  "<cmd>Yazi cwd<cr>",
		  desc = "Open the file manager in nvim's working directory",
		},
		{
		  "<c-up>",
		  "<cmd>Yazi toggle<cr>",
		  desc = "Resume the last yazi session",
		},
	  },
	  ---@type YaziConfig | {}
	  opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = false,
		keymaps = {
		  show_help = "<f1>",
		},
	  },
	  -- 👇 if you use `open_for_directories=true`, this is recommended
	  init = function()
		-- mark netrw as loaded so it's not loaded at all.
		--
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		vim.g.loaded_netrwPlugin = 1
	  end,
	},
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
        opts = {}, -- for default options, refer to the configuration section for custom setup.
    },
    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },
	{
		"lambdalisue/vim-suda"
	}
}

return M
