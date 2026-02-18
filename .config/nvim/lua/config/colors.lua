-- splitted from options.lua due to being loaded after lazy
-- -> colorschemes have to be present
vim.o.background = "dark"
if os.getenv("DISPLAY") ~= nil then
    -- Commands to set the colorscheme for graphical terminal
 	vim.cmd [[colorscheme kanagawabones]]
--	vim.cmd [[SolarizedLight]]
	--
	vim.o.termguicolors = true
	vim.api.nvim_set_hl(0, "Cursor", { fg = "#FFFFFF", bg = "#FF5500" })
	vim.o.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
else
   -- Commands to set the colorscheme for TTY terminal
    vim.cmd [[colorscheme default]]
end
