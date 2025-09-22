return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Treesitter for accurate syntax groups
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "json",
        "typescript",
        "javascript",
        "tsx",
        "html",
        "css",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
        "regex",
        "dockerfile",
        "gitignore",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- Optionally allow disabling semantic tokens quickly if overriding colors
  {
    "NvChad/NvChad", -- already loaded, this just allows us to hook after
    event = "VeryLazy",
    config = function()
      -- Uncomment to disable semantic tokens if they fight with colors
      -- for _, client in pairs(vim.lsp.get_clients()) do
      --   if client.server_capabilities.semanticTokensProvider then
      --     client.server_capabilities.semanticTokensProvider = nil
      --   end
      -- end
    end,
  },
}
