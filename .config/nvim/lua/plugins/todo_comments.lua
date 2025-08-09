local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")

return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre" },
    dependencies = { "folke/snacks.nvim" },
    opts = {},
    keys = {
        keymaps_helpers.make_lazy(keymaps.todo_comments.list, function()
            Snacks.picker.todo_comments()
        end),
        keymaps_helpers.make_lazy(
            keymaps.todo_comments.list_important,
            function()
                Snacks.picker.todo_comments({
                    keywords = { "TODO", "FIX", "FIXME" },
                })
            end
        ),
    },
}
