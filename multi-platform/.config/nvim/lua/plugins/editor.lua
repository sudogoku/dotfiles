return function(use)
    -- Nvim Tree file explorer
    use({
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_insensitive",
                filters = {
                    dotfiles = false,
                },
                git = {
                    enable = true,
                    ignore = false,
                },
            })
            vim.keymap.set(
                "n",
                "<leader>nn",
                ":NvimTreeToggle<CR>",
                { silent = true }
            )
            vim.keymap.set(
                "n",
                "<leader>nf",
                ":NvimTreeFindFile<CR>",
                { silent = true }
            )
        end,
    })

    -- Git status in column
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = require("configs.gitsigns"),
    })

    -- Pretty quickfix menu for LSP/Telescope/etc
    use({
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = require("configs.trouble"),
    })

    -- Telescope
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-live-grep-raw.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "folke/trouble.nvim",
        },
        config = require("configs.telescope"),
    })

    -- Automatic folds via LSP/Treesitter
    use({
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
        config = require("configs.nvim-ufo"),
    })

    -- Hotkeys for surrounding brackets/functions/HTML tags
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for latest features
        config = function()
            require("nvim-surround").setup()
        end,
    })

    -- Hotkeys to move in buffer
    use({
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        config = function()
            -- require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
            require("hop").setup()
            vim.keymap.set("n", "s", "<cmd>HopChar2<CR>")
            vim.keymap.set("n", "gl", "<cmd>HopLineStart<CR>")
        end,
    })

    -- Comment hotkeys
    use({
        "numToStr/Comment.nvim",
        config = require("configs.comment"),
    })

    -- Keep windows open when closing buffer
    use({
        "famiu/bufdelete.nvim",
        config = function()
            vim.keymap.set(
                "n",
                "<leader>d",
                ":Bdelete<CR>",
                { silent = true }
            )
            vim.keymap.set(
                "n",
                "<leader>w",
                ":Bwipeout<CR>",
                { silent = true }
            )
        end,
    })

    -- Automatically enter (){}[] while typing
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    })

    -- Floating terminal
    use({
        "akinsho/toggleterm.nvim",
        config = require("configs.toggleterm"),
    })

    -- Switch windows or to tmux from nvim
    use({
        "alexghergh/nvim-tmux-navigation",
        config = function()
            require("nvim-tmux-navigation").setup({})

            vim.keymap.set(
                "n",
                "<C-h>",
                ":NvimTmuxNavigateLeft<CR>",
                { silent = true }
            )
            vim.keymap.set(
                "n",
                "<C-j>",
                ":NvimTmuxNavigateDown<CR>",
                { silent = true }
            )
            vim.keymap.set(
                "n",
                "<C-k>",
                ":NvimTmuxNavigateUp<CR>",
                { silent = true }
            )
            vim.keymap.set(
                "n",
                "<C-l>",
                ":NvimTmuxNavigateRight<CR>",
                { silent = true }
            )
        end,
    })
end