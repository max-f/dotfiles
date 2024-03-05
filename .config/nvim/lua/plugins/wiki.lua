local M = {
    {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        end
    },

    {
        'vimwiki/vimwiki',
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = '~/Sync/notes',
                    syntax = 'markdown',
                    ext = '.md',
                },
            }
        end
    }
}

return M
