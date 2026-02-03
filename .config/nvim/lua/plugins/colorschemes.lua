local enabled_theme = "catppuccin/nvim"
local theme_plugins = {
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1001,
        config = function(_, opts)
            local palette = require("oldworld.palette")

            require("oldworld").setup(vim.tbl_extend("force", opts, {
                variant = "default",
                styles = {
                    booleans = { italic = true, bold = true },
                },
                integrations = {
                    treesitter = true,
                },
                highlight_overrides = {
                    -- Telescope
                    TelescopePreviewTitle = { fg = palette.fg, bg = palette.bg },
                    TelescopeResultsTitle = { fg = palette.fg, bg = palette.bg },
                    TelescopeBorder = { fg = palette.gray3, bg = palette.bg },
                },
            }))

            vim.cmd.colorscheme("oldworld")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            transparent_background = true,
            custom_highlights = function(colors)
                return {
                    Pmenu = { bg = colors.surface0 },
                }
            end,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)

            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },
    {
        "tiagovla/tokyodark.nvim",
        opts = {},
        priority = 1000,
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional

            vim.cmd.colorscheme("tokyodark")
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function(_, opts)
            require("tokyonight").setup(opts) -- calling setup is optional

            vim.cmd.colorscheme("tokyonight-night")
        end,
    },
}

for _, plugin in ipairs(theme_plugins) do
    local name = plugin[1]
    plugin.enabled = name == enabled_theme
end

return theme_plugins
