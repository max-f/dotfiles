vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, { desc = 'Format file' })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
