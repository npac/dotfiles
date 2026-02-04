return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependiencies = { "cathaysia/tree-sitter-asciidoc" },
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "asciidoc") then
        table.insert(opts.ensure_installed, "asciidoc")
      end
    end,

    build = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          local parsers = require("nvim-treesitter.parsers")
          parsers.asciidoc = {
            install_info = {
              url = "https://github.com/cathaysia/tree-sitter-asciidoc.git",
              revision = "276ae6b766830e9d9de9106713d94a6913279bc2",
              files = { "tree-sitter-asciidoc/src/parser.c", "tree-sitter-asciidoc/src/scanner.c" },
              branch = "master",
              generate_requires_npm = false,
              requires_generate_from_grammar = false,
            },
            tier = 1,
          }
          parsers.asciidoc_inline = {
            install_info = {
              url = "https://github.com/cathaysia/tree-sitter-asciidoc.git",
              revision = "276ae6b766830e9d9de9106713d94a6913279bc2",
              files = { "tree-sitter-asciidoc_inline/src/parser.c", "tree-sitter-asciidoc_inline/src/scanner.c" },
              branch = "master",
              generate_requires_npm = false,
              requires_generate_from_grammar = false,
            },
            tier = 1,
          }
        end,
      })
    end,

    init = function()
      --   vim.api.nvim_create_autocmd("User", {
      --     pattern = "TSUpdate",
      --     callback = function()
      --       require("nvim-treesitter.parsers").asciidoc = {
      --         install_info = {
      --           location = "tree-sitter-asciidoc",
      --           revision = "276ae6b766830e9d9de9106713d94a6913279bc2",
      --           url = "https://github.com/cathaysia/tree-sitter-asciidoc",
      --           branch = "master",
      --           generate = false,
      --           generate_from_json = false,
      --           queries = "tree-sitter-asciidoc/queries",
      --         },
      --         requires = { "asciidoc_inline" },
      --         tier = 2,
      --       }
      --     end,
      --   })
      --
      --   vim.api.nvim_create_autocmd("User", {
      --     pattern = "TSUpdate",
      --     callback = function()
      --       require("nvim-treesitter.parsers").asciidoc_inline = {
      --         install_info = {
      --           location = "tree-sitter-asciidoc_inline",
      --           revision = "276ae6b766830e9d9de9106713d94a6913279bc2",
      --           url = "https://github.com/cathaysia/tree-sitter-asciidoc",
      --           branch = "master",
      --           generate = false,
      --           generate_from_json = false,
      --           queries = "tree-sitter-asciidoc_inline/queries",
      --         },
      --         tier = 2,
      --       }
      --     end,
      --   })

      vim.treesitter.language.register("asciidoc", { "asciidoc", "adoc" })
    end,
  },
}
