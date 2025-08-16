-- Configure inline diagnostics for immediate error visibility
vim.diagnostic.config({
  virtual_text = {
    enabled = true,
    source = "if_many",
    spacing = 4,
    prefix = "●",
    severity = { min = vim.diagnostic.severity.ERROR },
  },
  signs = {
    enabled = true,
    priority = 20,
  },
  underline = {
    enabled = true,
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    enabled = true,
    source = "always",
    border = "rounded",
  },
})

-- Define diagnostic signs
local signs = {
  Error = "󰅚",
  Warn = "󰀪",
  Hint = "󰌶",
  Info = "󰋽",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return {}
