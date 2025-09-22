require "nvchad.autocmds"

-- Add custom theme loading
local autocmd = vim.api.nvim_create_autocmd

-- Register custom themes directory
autocmd("VimEnter", {
  callback = function()
    -- Ensure custom theme is available
    local ok, custom_theme = pcall(require, "themes.comfydark")
    if ok then
      -- Theme is available, base46 should handle it
      return
    end
  end,
})
