return {

    { "echasnovski/mini.icons" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "go", "javascript", "html", "markdown" },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "MagicDuck/grug-far.nvim",
        opts = {}
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>sg",       "<cmd>Telescope live_grep<cr>",  desc = "Search live Grep" }
        },
    }
}
