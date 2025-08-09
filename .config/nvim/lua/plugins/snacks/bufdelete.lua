local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")

return {
    "folke/snacks.nvim",
    keys = {
        keymaps_helpers.make_lazy(
            keymaps.snacks.bufdelete.delete_buffer,
            function()
                Snacks.bufdelete.delete({ force = false })
            end
        ),
        keymaps_helpers.make_lazy(
            keymaps.snacks.bufdelete.delete_other_buffers,
            function()
                Snacks.bufdelete.other({ force = false })
            end
        ),
    },
    opts = {},
}
