-- Turn off animation/smooth scrolling from Snacks (LazyVim default)
return {
  {
    "folke/snacks.nvim",
    opts = {
      animate = { enabled = false },
      -- some versions use modules; keep both for safety
      scroll = { enabled = false },
    },
  },
}
