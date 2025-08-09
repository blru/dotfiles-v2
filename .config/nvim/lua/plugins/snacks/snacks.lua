return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function(_, opts)
        require("snacks").setup(opts)

        -- Gitbrowse user command
        vim.api.nvim_create_user_command("GitBrowseOpen", function()
            Snacks.gitbrowse.open()
        end, {
            desc = "Opens the remote associated with the workspace git repository.",
        })
    end,
}
