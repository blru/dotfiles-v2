local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")

return {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Already lazy loaded
    enabled = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        keymaps_helpers.make_lazy(
            keymaps.markview.toggle,
            "<cmd>Markview attach<cr><cmd>Markview toggle<cr>"
        ),
    },
    opts = {},
    init = function()
        vim.g.markview_dark_bg = "dark"
    end,
    config = function(_, opts)
        local markview = require("markview")
        local presets = require("markview.presets")

        markview.setup(vim.tbl_extend("keep", {
            preview = {
                enable = false,
                icon_provider = "devicons",
            },
            html = {
                enable = false,
            },
            markdown = {
                enable = true,
                headings = presets.headings.glow,
                horizontal_rules = presets.arrowed,
                tables = presets.tables.single,
                code_blocks = {
                    label_direction = "left",
                },
            },
        }, opts))
    end,
}
