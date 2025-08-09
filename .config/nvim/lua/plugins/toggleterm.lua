local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
        keymaps_helpers.make_lazy(keymaps.toggleterm.toggle),
        keymaps_helpers.make_lazy(
            keymaps.toggleterm.list,
            "<cmd>TermSelect<CR>"
        ),
    },
    opts = {
        direction = "horizontal",
        size = 12,
        shade_terminals = false,
        open_mapping = keymaps.toggleterm.toggle.bind,
    },
}
