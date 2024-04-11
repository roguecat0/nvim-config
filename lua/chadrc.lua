-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "gruvbox",
  nvdash = {
    load_on_startup = true,
  },
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    order = nil,
    modules = nil,
  },
  -- hl_override = {
  --   MyHighlightGroup = {
  --     grey = "white",
  --   }
  -- }
  changed_themes = {
    gruvbox = {
      base_30 = {
        grey = "#a3b8ef",
      },
    },
  }
}

return M
