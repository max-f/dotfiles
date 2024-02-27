-- require("config")

require("config.options")
require("config.lazy")
require("config.colors")

vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        require("config.keymaps")
    end,
})
