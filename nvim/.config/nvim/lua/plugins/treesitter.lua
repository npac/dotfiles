return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "asciidoc") then
        table.insert(opts.ensure_installed, "asciidoc")
      end
    end,

    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          require("nvim-treesitter.parsers").asciidoc = {
            install_info = {
              location = "tree-sitter-asciidoc",
              revision = "276ae6b766830e9d9de9106713d94a6913279bc2",
              url = "https://github.com/cathaysia/tree-sitter-asciidoc",
              branch = "master",
              generate = false,
              generate_from_json = false,
              queries = "tree-sitter-asciidoc/queries",
            },
            requires = { "asciidoc_inline" },
            tier = 2,
          }
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          require("nvim-treesitter.parsers").asciidoc_inline = {
            install_info = {
              location = "tree-sitter-asciidoc_inline",
              revision = "276ae6b766830e9d9de9106713d94a6913279bc2",
              url = "https://github.com/cathaysia/tree-sitter-asciidoc",
              branch = "master",
              generate = false,
              generate_from_json = false,
              queries = "tree-sitter-asciidoc_inline/queries",
            },
            tier = 2,
          }
        end,
      })

      vim.treesitter.language.register("asciidoc", { "asciidoc", "adoc" })
    end,
  },
}
