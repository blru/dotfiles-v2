return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = true,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
                refresh_time = 16, -- ~60fps
                events = {
                    "WinEnter",
                    "BufEnter",
                    "BufWritePost",
                    "SessionLoadPost",
                    "FileChangedShellPost",
                    "VimResized",
                    "Filetype",
                    "CursorMoved",
                    "CursorMovedI",
                    "ModeChanged",
                    "LspProgress",
                },
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                {
                    "filename",
                    path = 1,
                },
                {
                    "lsp_status",
                    icon = "",
                    symbols = {
                        -- Standard unicode symbols to cycle through for LSP progress:
                        spinner = {
                            "⠋",
                            "⠙",
                            "⠹",
                            "⠸",
                            "⠼",
                            "⠴",
                            "⠦",
                            "⠧",
                            "⠇",
                            "⠏",
                        },
                        done = "✓",
                        separator = " ",
                    },
                    ignore_lsp = {},
                },
            },
            lualine_x = { "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        tabline = {},
        winbar = {},
        extensions = {},
    },
    init = function()
        vim.opt.showmode = false -- Hide default mode display
    end,
    config = function(_, opts)
        local lualine = require("lualine")

        lualine.setup(opts)
    end,
}
