-- Set active indent guide (scope) to bright pink in Neovim
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = { "IblScopePink" },
      },
    },
    config = function(_, opts)
      -- Bright pink for the active indent scope line
      vim.api.nvim_set_hl(0, "IblScopePink", { fg = "#ff4da6" })
      require("ibl").setup(opts)
    end,
  },
}
