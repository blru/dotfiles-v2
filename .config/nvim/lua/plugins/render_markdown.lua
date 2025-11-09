return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    enabled = false,
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        sign = { enabled = false },
        html = {
            comment = {
                conceal = false,
            },
        },
    },
}
