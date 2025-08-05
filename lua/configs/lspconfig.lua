-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
require("onload_mappings").lsp()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers =
  { "pyright", "rust_analyzer", "tflint", "ts_ls", "terraformls", "tflint", "gopls", "gleam", "html", "tailwindcss" } -- "html", "cssls","jedi_language_server"
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local templates = { "html", "jinja_lsp" }
for _, lsp in ipairs(templates) do
  lspconfig[lsp].setup {
    filetypes = { "htmldjango", "html" },
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
