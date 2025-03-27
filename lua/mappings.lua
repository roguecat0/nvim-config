require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- tmux compat
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })
-- file navigation
map("n", "<S-l>", "<Tab>", { remap = true })
map("n", "<S-h>", "<S-Tab>", { remap = true })
-- fugitive
map("n", "<leader>gg", "<cmd> Git<CR>", { desc = "Git status" })
-- nice from prime
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected up" })

map("x", "<leader>pp", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map("n", "<leader>k", "<cmd>cnext<CR>zz")
map("n", "<leader>j", "<cmd>cprev<CR>zz")

-- Diagnostics
-- Show diagnostics in a floating window
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Diagnostics open" })

-- Move to the previous diagnostic
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Diagnostics previous" })

-- Move to the next diagnostic
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Diagnostics next" })
