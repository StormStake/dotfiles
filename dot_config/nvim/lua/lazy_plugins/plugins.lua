return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
    {"echasnovski/mini.icons"},
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "go", "javascript", "html" },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    },
    { 
        "MagicDuck/grug-far.nvim",
        config = function()
            require('grug-far').setup({
            });
        end
    }

}
