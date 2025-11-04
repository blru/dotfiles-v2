return {
    "catppuccin/nvim",
    name = "catppuccin",
    enable = false,
    priority = 1000,
    opts = {},
    init = function()
        vim.cmd.colorscheme("catppuccin-macchiato")
    end,
}
