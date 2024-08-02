local M = {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        keys = {
            { "<leader>p", "<cmd>BufferLineTogglePin<cr>" },
        },
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                hover = {
                    enabled = true,
                    delay = 0,
                    reveal = { "close" }, },
            },
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('gitsigns').setup()
        end
    },

    "rktjmp/lush.nvim",

    -- colorschemes
    {
        "drsooch/gruber-darker-vim"
    },
    {
        "mcchrish/zenbones.nvim",
        -- config = function()
        --     vim.cmd('colorscheme seoulbones')
        -- end,
    },
    "ellisonleao/gruvbox.nvim",
    "rebelot/kanagawa.nvim",
    {
      'projekt0n/github-nvim-theme',
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        require('github-theme').setup({
          -- ...
        })

        -- vim.cmd('colorscheme github_dark')
      end,
    },
    "sainnhe/sonokai"
}

return M
