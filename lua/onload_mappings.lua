-- git signs
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

return {
  gitsigns = gitsigns_mapping,
}
