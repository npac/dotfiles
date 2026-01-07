return {
  {
    "zbirenbaum/copilot.lua",
    requires = {
      "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true, -- Automatically trigger suggestions in insert mode
        },
        filetypes = {
          markdown = true, -- Enable for Markdown files
          javascript = true, -- Enable for JavaScript files
          go = true,
          aschiidoc = true,
          ["*"] = false, -- Disable for all other filetypes
        },
        -- logger = {
        --   trace_lsp = "verbose",
        --   log_lsp_messages = true,
        -- },
      })
    end,
  },
}
