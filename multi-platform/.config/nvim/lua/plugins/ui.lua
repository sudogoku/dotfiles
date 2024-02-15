return {
  -- Color theme
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        contrast = {
          terminal = true,
          sidebars = false,
          floating_windows = false,
          cursor_line = true,
          non_current_windows = true,
        },
        plugins = {
          "dashboard",
          "gitsigns",
          "hop",
          "indent-blankline",
          "lspsaga",
          "nvim-cmp",
          "nvim-tree",
          "nvim-web-devicons",
          "telescope",
          "trouble",
        },
      })
      -- Set the theme
      vim.o.background = "dark"
      vim.g.material_style = "deep ocean"
      vim.cmd("colorscheme material")
    end,
  },

  -- Welcome dashboard
  {
    "nvimdev/dashboard-nvim",
    config = require("configs.dashboard"),
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Show line indents
  {
    "lukas-reineke/indent-blankline.nvim",
    config = require("configs.indent-blankline"),
    dependencies = {
      "HiPhish/rainbow-delimiters.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        hide_cursor = true,
        respect_scrolloff = true,
        cursor_scrolls_alone = true,
        performance_mode = true,
      })
    end,
  },

  -- Better buffer tab line
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = require("configs.bufferline-config"),
  },

  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  -- Color hex codes
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*",
        css = { css = true },
      })
    end,
  },

  -- Custom number/folds/gitsigns column
  {
    "luukvbaal/statuscol.nvim",
    config = require("configs.statuscol"),
  },
}
