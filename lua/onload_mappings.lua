-- git signs
local map = vim.keymap.set
local function gitsigns_mapping(bufnr)
  local gitsigns = require "gitsigns"

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "gitsigns preview hunk" })
  map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "gitsigns reset hunk" })
  map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "gitsigns stage buffer" })
  map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "gitsigns reset buffer" })
end
-- dap
local function dap_map()
  local dap = require "dap"
  map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug toggle breakpoint" })
  map("n", "<leader>dc", dap.continue, { desc = "Debug continue" })
  map("n", "<Leader>dq", dap.terminate, { desc = "Debug terminate" })
  map("n", "<leader>di", dap.step_into, { desc = "Debug Step Into" })
  map("n", "<leader>dv", dap.step_over, { desc = "Debug Step Over" })
  map("n", "<leader>do", dap.step_out, { desc = "Debug Step Out" })
end

local function dap_ui_map(dapui)
  map("n", "<leader>dt", dapui.toggle, { desc = "Debug toggle ui" })
end
local function dap_python_map()
  map("n", "<leader>dpr", function()
    require("dap-python").test_method()
  end, { desc = "Debug run python" })
end
-- LSP
function lsp_map()
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
end

return {
  gitsigns = gitsigns_mapping,
  dap = dap_map,
  dap_ui = dap_ui_map,
  dap_python = dap_python_map,
  lsp = lsp_map,
}
