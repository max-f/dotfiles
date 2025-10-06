-- splitted from options.lua due to being loaded after lazy
-- -> colorschemes have to be present
-- vim.o.background = "light"
if os.getenv("DISPLAY") ~= nil then
    -- Commands to set the colorscheme for graphical terminal
	vim.cmd [[colorscheme solarized_jetbrains]]
	vim.cmd [[SolarizedLight]]
else
   -- Commands to set the colorscheme for TTY terminal
    vim.cmd [[colorscheme default]]
end
