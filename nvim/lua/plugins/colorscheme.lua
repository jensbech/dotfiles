return {
  -- Add VS Code theme
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local c = require('vscode.colors').get_colors()
  require('vscode').setup({
        -- Alternatively set style in setup
        style = 'dark',

        -- Enable transparent background
        transparent = false,

        -- Enable italic comment
        italic_comments = true,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,

        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
          vscLineNumber = '#858585',
          vscBack = '#0d1117',
          vscTabCurrent = '#0d1117',
          vscPopupBack = '#0d1117',
        },

        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
          Normal = { bg = '#0d1117' },
          NormalNC = { bg = '#0d1117' },
          NormalFloat = { bg = '#0d1117' },
          SignColumn = { bg = '#0d1117' },
          LineNr = { bg = '#0d1117' },
          VertSplit = { bg = '#0d1117' },
          StatusLine = { bg = '#0d1117' },
          TabLine = { bg = '#0d1117' },
          CursorLine = { bg = '#0f141b' },
          CursorLineNr = { bg = '#0f141b' },
          Pmenu = { bg = '#0f141b' },
          PmenuSel = { bg = '#132036' },
          FloatBorder = { bg = '#0d1117' },
          TelescopeNormal = { bg = '#0d1117' },
          TelescopeBorder = { bg = '#0d1117' },
          NvimTreeNormal = { bg = '#0d1117' },
          NvimTreeNormalNC = { bg = '#0d1117' },
          NvimTreeWinSeparator = { bg = '#0d1117' },
          WhichKeyFloat = { bg = '#0d1117' },
        }
      })
      
      -- Load the colorscheme
      vim.cmd.colorscheme('vscode')
    end,
  },

  -- Configure LazyVim to use vscode theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
