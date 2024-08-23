return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        spec = {
            {
                mode = { "n", "v" },
                { "<leader>c", group = "code" },
                { "<leader>f", group = "file/find" },
                { "<leader>g", group = "goto" },
                { "<leader>l", group = "LSP" },
                { "<leader>s", group = "search" },
                { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
                { "[", group = "prev" },
                { "]", group = "next" },
                { "g", group = "goto" },
                { "gs", group = "surround" },
                { "z", group = "fold" },
            },
        },
    },
}
