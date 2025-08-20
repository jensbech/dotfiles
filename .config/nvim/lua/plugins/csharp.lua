-- C# / OmniSharp setup for LazyVim
-- - Installs OmniSharp via Mason
-- - Enables LSP for C# via lspconfig
-- - Ensures Treesitter parser for c_sharp

return {
  -- Ensure OmniSharp and CSharpier are installed by Mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "omnisharp",
        "csharpier",
      })
    end,
  },

  -- Optional: better go-to-definition for OmniSharp
  { "Hoffs/omnisharp-extended-lsp.nvim", module = "omnisharp_extended" },

  -- LSP config for C#
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- OmniSharp Roslyn LSP
        omnisharp = {
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
          -- Use omnisharp-extended for improved definitions if available
          handlers = {
            ["textDocument/definition"] = function(...)
              local ok, h = pcall(require, "omnisharp_extended")
              if ok then return h.handler(...) end
            end,
            ["textDocument/typeDefinition"] = function(...)
              local ok, h = pcall(require, "omnisharp_extended")
              if ok then return h.type_definition_handler(...) end
            end,
            ["textDocument/references"] = function(...)
              local ok, h = pcall(require, "omnisharp_extended")
              if ok then return h.references_handler(...) end
            end,
            ["textDocument/implementation"] = function(...)
              local ok, h = pcall(require, "omnisharp_extended")
              if ok then return h.implementation_handler(...) end
            end,
          },
        },
      },
    },
  },

  -- Treesitter parser for C#
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "c_sharp") then
        table.insert(opts.ensure_installed, "c_sharp")
      end
    end,
  },

  -- Configure formatting via conform.nvim using csharpier
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.cs = { "csharpier" }
    end,
  },
}
