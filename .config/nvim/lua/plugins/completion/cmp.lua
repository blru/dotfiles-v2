return {
    "hrsh7th/nvim-cmp",
    event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local icons = require("common.icons")
        local keymaps = require("common.keymaps")
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- TODO: Make it so that mappings can be used in both cmdline and insert. Probably something to do with how the __call metamethod is implemented
        local cmdline_mapping_overrides = {
            [keymaps.common.list_up.bind] = {
                c = cmp.mapping.select_prev_item(),
            },
            [keymaps.common.list_down.bind] = {
                c = cmp.mapping.select_next_item(),
            },
        }

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                [keymaps.common.list_up.bind] = cmp.mapping.select_prev_item(),
                [keymaps.common.list_down.bind] = cmp.mapping.select_next_item(),
                [keymaps.common.preview_up.bind] = cmp.mapping.scroll_docs(-4),
                [keymaps.common.preview_down.bind] = cmp.mapping.scroll_docs(4),
                [keymaps.cmp.complete.bind] = cmp.mapping.complete(),
                [keymaps.cmp.confirm.bind] = cmp.mapping.confirm({
                    select = true,
                }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "luasnip" },
                { name = "buffer" },
            }),
            formatting = {
                format = function(entry, vim_item)
                    vim_item.kind = string.format(
                        "%s %s",
                        icons.kind[vim_item.kind],
                        vim_item.kind
                    )
                    return vim_item
                end,
            },
        })

        -- `/` cmdline setup.
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(cmdline_mapping_overrides),
            sources = {
                { name = "buffer" },
            },
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(cmdline_mapping_overrides),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end,
}
