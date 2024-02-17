return {
  {
    "RRethy/nvim-treesitter-textsubjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        textsubjects = {
          enable = true,
          prev_selection = ",",
          keymaps = {
            ["."] = {
              "textsubjects-smart",
              desc = "Smart Text Object (LSP)",
            },
            -- [";"] = {
            --   "textsubjects-container-outer",
            --   desc = "select outside lsp container",
            -- },
            -- ["i;"] = {
            --   "textsubjects-container-inner",
            --   desc = "select inside lsp container",
            -- },
          },
        },
      })
    end,
  },
}
