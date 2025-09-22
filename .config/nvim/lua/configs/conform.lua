local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- Web / JS ecosystem
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    jsonc = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
  },

  -- Uncomment to enable format on save globally (or configure autocmd yourself)
  -- format_on_save = {
  --   timeout_ms = 800,
  --   lsp_fallback = true,
  -- },

  -- You can customize formatters; prefer prettierd if available for speed
  formatters = {
    prettierd = {
      condition = function(self, ctx)
        -- Only use prettierd if a project file indicates JS/TS workspace; else fall back
        local found = vim.fs.find({
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.js",
          ".prettierrc.cjs",
          "prettier.config.js",
          "prettier.config.cjs",
          "package.json",
        }, { upward = true, path = ctx.dirname })
        return #found > 0
      end,
    },
  },
}

return options
