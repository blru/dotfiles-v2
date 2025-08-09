return {
    "folke/snacks.nvim",

    ---@type snacks.Config
    opts = {
        bigfile = {
            notify = true,
            size = 1.5 * 1024 * 1024, -- 1.5MB
            line_length = 2000, -- average line length (useful for minified files)
            ---@param ctx {buf: number, ft:string}
            setup = function(ctx)
                if vim.fn.exists(":NoMatchParen") ~= 0 then
                    vim.cmd([[NoMatchParen]])
                end

                Snacks.util.wo(0, {
                    foldmethod = "manual",
                    statuscolumn = "",
                    conceallevel = 0,
                })

                vim.schedule(function()
                    if vim.api.nvim_buf_is_valid(ctx.buf) then
                        vim.bo[ctx.buf].syntax = ctx.ft
                    end
                end)
            end,
        },
    },
}
