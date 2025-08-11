local keymaps = require("common.keymaps")
local keymaps_helpers = require("common.keymaps.helpers")

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-lua/plenary.nvim",
    },
    keys = {
        keymaps_helpers.make_lazy(
            keymaps.dap.set_conditional_breakpoint,
            function()
                require("dap").set_breakpoint(
                    vim.fn.input("Breakpoint condition: ")
                )
            end
        ),
        keymaps_helpers.make_lazy(keymaps.dap.toggle_breakpoint, function()
            require("dap").toggle_breakpoint()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.continue, function()
            require("dap").continue()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.run_with_args, function()
            require("dap").continue({ before = get_args })
        end),
        keymaps_helpers.make_lazy(keymaps.dap.run_to_cursor, function()
            require("dap").run_to_cursor()
        end),
        keymaps_helpers.make_lazy(
            keymaps.dap.goto_line_without_executing,
            function()
                require("dap").goto_()
            end
        ),
        keymaps_helpers.make_lazy(keymaps.dap.step_into, function()
            require("dap").step_into()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.down, function()
            require("dap").down()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.up, function()
            require("dap").up()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.run_last, function()
            require("dap").run_last()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.step_out, function()
            require("dap").step_out()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.step_over, function()
            require("dap").step_over()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.pause, function()
            require("dap").pause()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.toggle_repl, function()
            require("dap").repl.toggle()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.session, function()
            require("dap").session()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.terminate, function()
            require("dap").terminate()
        end),
        keymaps_helpers.make_lazy(keymaps.dap.widgets, function()
            require("dap.ui.widgets").hover()
        end),
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb",
        }

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                program = function()
                    return coroutine.create(function(co)
                        local picker = Snacks.picker.pick({
                            finder = "files",
                            transform = function(item, _)
                                -- TODO: Cleanup and check if ./ actually resolve to the cwd all the time
                                local isExecutable = vim.fn.executable(
                                    "./" .. item.file
                                ) == 1
                                if item.file ~= nil and isExecutable then
                                    return item
                                end

                                return false
                            end,
                            confirm = function(picker, item)
                                picker:close()

                                if item then
                                    coroutine.resume(co, item.file)
                                end
                            end,
                        })
                        picker:show()
                    end)
                end,
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

        -- TODO: Maybe move this to common.icons in the future, although these are also colors
        local signs = {
            Breakpoint = { "", "red" },
            BreakpointCondition = { "", "red" },
            LogPoint = { "", "red" },
            Stopped = { "", "yellow" },
            BreakpointRejected = { "", "gray" },
        }
        for type, iconColorPair in pairs(signs) do
            local icon, color = unpack(iconColorPair)

            local hl = "Dap" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = color, numhl = "" })
        end

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
}
