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
          Normal = { bg = "none" },
          NormalFloat = { bg = "none" },
          SignColumn = { bg = "none" },
          CursorLine = { bg = "none" },
          CursorLineNr = { bg = "none" },
          LineNr = { bg = "none" },
          WinSeparator = { fg = "#2a2a2a", bg = "none" },
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
