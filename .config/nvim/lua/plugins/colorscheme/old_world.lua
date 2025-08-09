return {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1001,
    enabled = true,
    config = function(_, opts)
        local palette = require("oldworld.palette")

        require("oldworld").setup(vim.tbl_extend("force", opts, {
            variant = "default",
            styles = {
                booleans = { italic = true, bold = true },
            },
            integrations = {},
            highlight_overrides = {
                -- Telescope
                TelescopePreviewTitle = { fg = palette.fg, bg = palette.bg },
                TelescopeResultsTitle = { fg = palette.fg, bg = palette.bg },
                TelescopeBorder = { fg = palette.gray3, bg = palette.bg },
            },
        }))

        vim.cmd.colorscheme("oldworld")
    end,
}
