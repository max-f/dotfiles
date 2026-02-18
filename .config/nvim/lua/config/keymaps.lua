vim.g.mapleader = ","
vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, { desc = 'Format file' })
vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- buffer tab navigation
vim.keymap.set('n', '<leader>n', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>p', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>d', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })
