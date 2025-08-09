local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")

return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp", -- install jsregexp (optional!).
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {},
    config = function(_, opts)
        local luasnip = require("luasnip")
        luasnip.setup(opts)

        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()

        keymaps_helpers.map(keymaps.luasnip.forward, function()
            luasnip.jump(1)
        end, { silent = true, noremap = true })
        keymaps_helpers.map(keymaps.luasnip.backward, function()
            luasnip.jump(-1)
        end, { silent = true, noremap = true })
    end,
}
