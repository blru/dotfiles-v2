return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
        ensure_installed = {
            -- formatters
            "beautysh",
            "prettier",
            "stylua",

            -- lsps
            "bash-language-server",
            "lua-language-server",
            "css-lsp",
            "luau-lsp",
            "emmet-language-server",
            "json-lsp",
        },
        run_on_start = false,
    },
    config = function(_, opts)
        local mason_tool_installer = require("mason-tool-installer")

        mason_tool_installer.setup(opts)
    end,
}
