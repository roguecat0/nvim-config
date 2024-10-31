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

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- fugitive
map("n", "<leader>gg", "<cmd> Git<CR>", { desc = "Git status" })

-- Diagnostics
-- Show diagnostics in a floating window
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Diagnostics open" })

-- Move to the previous diagnostic
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Diagnostics previous" })

-- Move to the next diagnostic
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Diagnostics next" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = event.buf }
      vim.keymap.set(mode, lhs, rhs, opts)
    end
    -- You can find details of these function in the help page
    -- see for example, :help vim.lsp.buf.hover()

    -- Display documentation of the symbol under the cursor
    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

    -- Jump to the definition
    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

    -- Jump to declaration
    bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

    -- Lists all the implementations for the symbol under the cursor
    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

    -- Jumps to the definition of the type symbol
    bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

    -- Lists all the references
    bufmap("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>")

    -- Renames all references to the symbol under the cursor
    bufmap("n", "<C-K>", "<cmd>lua vim.lsp.buf.rename()<cr>")

    -- Displays a function's signature information
    bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

    -- Selects a code action available at the current cursor position
    bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
  end,
})
