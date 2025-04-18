return {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    commit = "b35e6b2381e4980e08fdf7549867270e10a6e59f",
    opts = {},
    config = function()
        require("flow").setup {
            transparent = false, -- Set transparent background.
            fluo_color = "pink", --  Fluo color: pink, yellow, orange, or green.
            mode = "bright",    -- Intensity of the palette: normal, bright, desaturate, or dark. Notice that dark is ugly!
            aggressive_spell = false, -- Display colors for spell check.
        }

        vim.cmd "colorscheme flow"
    end,
}
