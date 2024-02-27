-- splitted from options.lua due to being loaded after lazy
-- -> colorschemes have to be present
vim.o.background = "dark"
if os.getenv("DISPLAY") ~= nil then
    -- Commands to set the colorscheme for graphical terminal
    vim.cmd [[colorscheme sonokai]]
else
    -- Commands to set the colorscheme for TTY terminal
    vim.cmd [[colorscheme torte]]
end
