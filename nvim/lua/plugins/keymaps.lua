-- Extra keymaps: context-aware code actions (Quick Fix)
return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code Action", mode = { "n", "v" } },
  { "<C-.>", function() vim.lsp.buf.code_action() end, desc = "Code Action", mode = { "n", "v" } },
    },
  },
}
