-- tabs
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = false -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

local root_files = {'composer.json'}
local paths = vim.fs.find(root_files, {stop = vim.env.HOME})

print(vim.fs.dirname(paths[1]))
