return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    lazy = false,
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- redirect setup to correct module
    opts = function(_, _)
      return {
        ensure_installed = {
          "lua",
          "tsx",
          "typescript",
          "go",
          "gomod",
          "gosum",
        },
        highlight = { enable = true },
        indent = { enabled = true },
      }
    end,
  },
}
