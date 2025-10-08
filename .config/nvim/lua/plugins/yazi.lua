local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")

---@type LazySpec
return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    enabled = true,
    dependencies = {
        "folke/snacks.nvim",
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        keymaps_helpers.make_lazy(
            keymaps.yazi.open_at_current_file,
            "<cmd>Yazi<cr>"
        ),
        keymaps_helpers.make_lazy(
            keymaps.yazi.open_in_cwd,
            "<cmd>Yazi cwd<cr>"
        ),
        keymaps_helpers.make_lazy(
            keymaps.yazi.open_in_cwd,
            "<cmd>Yazi toggle<cr>"
        ),
    },
    ---@type YaziConfig | {}
    opts = {
        open_for_directories = true,
        keymaps = {
            show_help = keymaps.common.show_help.bind,
            open_file_in_vertical_split = keymaps.common.open_vsplit.bind,
            open_file_in_horizontal_split = keymaps.common.open_split.bind,
            copy_relative_path_to_selected_files = "<c-y>", -- doesn't work?
            grep_in_directory = "<c-s>",
            send_to_quickfix_list = keymaps.common.send_to_quickfix_list.bind,
            open_and_pick_window = keymaps.common.confirm_secondary.bind,
        },
        integrations = {
            grep_in_directory = function(directory)
                Snacks.picker.files({ dirs = { directory } })
            end,
        },
    },
}
