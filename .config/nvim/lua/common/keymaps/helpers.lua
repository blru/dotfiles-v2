--- @alias keymap { bind: string, description: string | nil, mode: string[] | nil }

local M = {}

---@param keymap keymap
---@param rhs string | function | nil
---@param additional_options table | nil
function M.make_lazy(keymap, rhs, additional_options)
    local options = {
        keymap.bind,
        rhs,
        desc = keymap.description,
        mode = keymap.mode,
    }

    if additional_options ~= nil then
        vim.tbl_extend("force", options, additional_options)
    end

    return options
end

--- Creates args for vim.keymap.set
---@param keymap keymap
---@param rhs string | function
---@param additional_options table | nil
function M.make_map_args(keymap, rhs, additional_options)
    local options = {
        desc = keymap.description,
    }

    if additional_options ~= nil then
        vim.tbl_extend("force", options, additional_options)
    end

    local mode = keymap.mode or { "n" }
    local lhs = keymap.bind

    return mode, lhs, rhs, options
end

---Wrapper around vim.keymap.set
---@param keymap keymap
---@param rhs string | function
---@param additional_options table | nil
function M.map(keymap, rhs, additional_options)
    vim.keymap.set(M.make_map_args(keymap, rhs, additional_options))
end

return M
