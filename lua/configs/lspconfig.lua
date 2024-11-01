-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
require("onload_mappings").lsp()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "pyright" } -- "html", "cssls","jedi_language_server"
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
