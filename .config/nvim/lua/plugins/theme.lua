-- Configure VS Code Dark theme with custom background
return {
  -- Use vscode.nvim theme
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    lazy = false,
    opts = function()
      require("vscode").setup({
        transparent = false,
        italic_comments = false,
        disable_nvimtree_bg = true,
        group_overrides = {
          Normal = { bg = "#06080a" },
          NormalFloat = { bg = "#06080a" },
          SignColumn = { bg = "#06080a" },
          CursorLine = { bg = "#0a0d10" },
          CursorLineNr = { bg = "#0a0d10" },
          LineNr = { bg = "#06080a" },
          WinSeparator = { fg = "#2a2a2a", bg = "#06080a" },
        },
      })
      require("vscode").load()
    end,
  },

  -- Ensure LazyVim uses the theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
