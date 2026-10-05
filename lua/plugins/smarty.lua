return {
  {
    dir = vim.fn.expand "~/programming/tools/smarty",
    name = "tree-sitter-smarty2",
    lazy = false,
    build = "mkdir -p parser && node_modules/.bin/tree-sitter build --output parser/smarty2.so",
    init = function()
      vim.treesitter.language.register("smarty2", "smarty")
      vim.filetype.add {
        extension = { tpl = "smarty" },
      }
    end,
  },
}
