local options = {
  signs = {
    delete = { text = "󰍵" },
    changedelete = { text = "󱕖" },
  },
  on_attach = require("onload_mappings").gitsigns,
}
return options
