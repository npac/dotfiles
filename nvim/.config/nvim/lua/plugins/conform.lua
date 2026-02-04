return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        graphql = { "prettier" },
        xml = { "xmllint" }, -- Handles .xml and .xsd (filetype=xml)
        xsd = { "xmllint" }, -- Handles .xml and .xsd (filetype=xml)
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      formatters = {
        xmllint = {
          command = "xmllint",
          env = { XMLLINT_INDENT = "    " }, -- 4 spaces
          args = { "--format", "-" },
          stdin = true,
        },
      },
    },
  },
}
