return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
        ensure_installed = {
            -- Formatters
            "beautysh",
            "clang-format",
            "prettier",
            "stylua",

            -- LSPs
            "bash-language-server",
            "clangd",
            "css-lsp",
            "emmet-language-server",
            "json-lsp",
            "lua-language-server",
            "luau-lsp",
            "typescript-lanaguage-server",
            "zig",

            -- DAPs
            "codelldb",
        },
        run_on_start = false,
    },
    config = function(_, opts)
        local mason_tool_installer = require("mason-tool-installer")

        mason_tool_installer.setup(opts)
    end,
}
