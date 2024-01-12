local M = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
              -- see :help lsp-zero-keybindings
              -- to learn the available actions
              lsp_zero.default_keymaps({buffer = bufnr})
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
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
}

return M
