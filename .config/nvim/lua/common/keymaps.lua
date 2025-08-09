return {
    -- Keymaps used by various plugins
    common = {
        show_help = {
            bind = "<f1>",
            description = "Opens the help menu depending on the gui",
        },
        list_up = {
            bind = "<C-k>",
            description = "Bind used for selecting the item above in Telescope and cmp",
        },
        list_down = {
            bind = "<C-j>",
            description = "Bind used for selecting the item below in Telescope and cmp",
        },
        preview_up = {
            bind = "<C-u>",
            description = "Bind used for going up in previews and documentation in cmp and Telescope",
        },
        preview_down = {
            bind = "<C-d>",
            description = "Bind used for going down in previews and documentation in cmp and Telescope",
        },
        delete_word = {
            bind = "<C-w>",
            description = "Deletes a word",
        },
        history_forward = {
            bind = "<C-n>",
            description = "Goes forward in history when it comes to terminals and pickers",
        },
        history_backward = {
            bind = "<C-p>",
            description = "Goes backwards in history when it comes to terminals and pickers",
        },
        confirm = {
            bind = "<CR>",
            description = "Confirms a selection in things like snacks pickers",
        },
        confirm_secondary = {
            bind = "<S-CR>",
            description = "Confirms a selection but in a different way in things like snacks pickers",
        },
        open_split = {
            bind = "<c-x>",
            description = "Opens in a horizontal split.",
        },
        open_vsplit = {
            bind = "<c-v>",
            description = "Opens in a vertical split.",
        },
        send_to_quickfix_list = {
            bind = "<c-q>",
            description = "Sends the selected item to the quickfix list",
        },
    },

    -- Keymaps unrelated to a specific plugin
    general = {
        save_file = {
            bind = "<C-s>",
            description = "Saves the current file using :up",
            mode = { "n" },
        },
        toggle_wrap = {
            bind = "<A-z>",
            description = "Toggles text wrapping",
            mode = { "n" },
        },
        previous_buffer = {
            bind = "<C-S-Tab>",
            description = "Goes to the previous buffer",
            mode = { "n" },
        },
        next_buffer = {
            bind = "<C-Tab>",
            description = "Goes to the next buffer",
            mode = { "n" },
        },
    },

    -- Plugin keymaps
    conform = {
        format = {
            bind = "<leader>ff",
            description = "Formats the current buffer or selection",
            mode = { "n", "v" },
        },
    },
    snacks = {
        picker = {
            find_files = {
                bind = "<C-p>",
                description = "Finds files in the current working directory",
                mode = { "n" },
            },
            find_buffers = {
                bind = "<leader>p",
                description = "Finds open buffers",
                mode = { "n" },
            },
            find_recents = {
                bind = "<leader>fr",
                description = "Finds recently opened files",
                mode = { "n" },
            },
            find_string = {
                bind = "<leader>fs",
                description = "Finds string in the current working directory",
                mode = { "n" },
            },
            git_log = {
                bind = "<leader>fg",
                description = "Lists items in the git log",
                mode = { "n" },
            },
            git_status = {
                bind = "<leader>fG",
                description = "Lists items in the git status",
                mode = { "n" },
            },
            lsp_symbols = {
                bind = "<leader>fy",
                description = "Lists symbols detected by the LSP in the current buffer.",
                mode = { "n" },
            },
            lsp_workspace_symbols = {
                bind = "<leader>fY",
                description = "Lists symbols detected by the LSP in the current workspace.",
                mode = { "n" },
            },
            diagnostics = {
                bind = "<leader>fd",
                description = "Shows diagnostics in the current buffer.",
                mode = { "n" },
            },
            workspace_diagnostics = {
                bind = "<leader>fD",
                description = "Shows diagnostics in the current workspace.",
                mode = { "n" },
            },
            goto_definition = { bind = "gd", description = "Goto Definition" },
            goto_declaration = { bind = "gD", description = "Goto Declaration" },
            references = {
                bind = "gr",
                nowait = true,
                description = "References",
            },
            goto_implementation = {
                bind = "gI",
                description = "Goto Implementation",
            },
            goto_type_definition = {
                bind = "gy",
                description = "Goto T[y]pe Definition",
            },
            --[[
            -- See https://neovim.io/doc/user/lsp.html#lsp-defaults for built-in LSP binds
            --
            -- grn -> Smart Rename
            -- gra -> Code Action
            -- K -> Documentation
            --]]
        },
        bufdelete = {
            delete_buffer = {
                bind = "<leader>q",
                description = "Closes the current buffer and goes to the previous buffer",
                mode = { "n" },
            },
            delete_other_buffers = {
                bind = "<leader><S-q>",
                description = "Closes every other buffer except the current one.",
                mode = { "n" },
            },
        },
    },
    yazi = {
        open_at_current_file = {
            bind = "<leader>-",
            description = "Open Yazi at the current file",
            mode = { "n", "v" },
        },
        open_in_cwd = {
            bind = "<leader><C-->",
            description = "Open Yazi in nvim's working directory",
        },
        resume_last_session = {
            bind = "<leader><S-->",
            description = "Resume the last Yazi session",
        },
    },
    cmp = {
        confirm = {
            bind = "<Tab>",
            description = "Selects an auto-completion",
        },
        complete = {
            bind = "<C-Space>",
            description = "Opens the auto-complete popup",
            mode = { "i" },
        },
    },
    luasnip = {
        forward = { bind = "<C-l>", mode = { "i", "s" } },
        backward = { bind = "<C-h>", mode = { "i", "s" } },
    },
    toggleterm = {
        toggle = {
            bind = "<C-`>",
            description = "Toggles the visibility of the terminal.",
            mode = { "n" },
        },
        list = {
            bind = "<leader>ftt",
            description = "Opens the terminal selection menu",
            mode = { "n" },
        },
    },
    todo_comments = {
        list = {
            bind = "<leader>ftO",
            description = "Opens the todo comment list.",
            mode = { "n" },
        },
        list_important = {
            bind = "<leader>fto",
            description = "Opens the todo comment list but only for TODO, FIX and FIXME comments.",
            mode = { "n" },
        },
    },
    auto_session = {
        open_session_lens = {
            bind = "<leader>fx",
            description = "Opens the session picker",
            mode = { "n" },
        },
    },
    lsp = {
        show_line_diagnostics = {
            bind = "<leader>ge",
            description = "Show diagnostics information for what is under cursor",
            mode = { "n" },
        },
    },
}
