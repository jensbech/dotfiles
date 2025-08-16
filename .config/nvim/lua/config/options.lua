-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable inline diagnostics with virtual text
vim.diagnostic.config({
  virtual_text = {
    enabled = true,
    source = "if_many",
    spacing = 4,
    prefix = "●",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

-- Define diagnostic signs
local signs = { Error = "󰅚", Warn = "󰀪", Hint = "󰌶", Info = "󰋽" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Line numbers: absolute on, relative off
vim.opt.number = true
vim.opt.relativenumber = false
