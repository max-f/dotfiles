local M = {
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
