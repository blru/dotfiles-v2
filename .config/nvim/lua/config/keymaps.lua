-- This file is for initializing keymaps that don't have anything to do with the plugins. This is not where keymaps are centrally defined (see "common.keymaps").

local keymaps = require("common.keymaps")
local map = require("common.keymaps.helpers").map

map(keymaps.general.save_file, "<cmd>up<cr>")
map(keymaps.general.toggle_wrap, "<cmd>set wrap!<cr>")
map(keymaps.general.previous_buffer, "<cmd>bprev<cr>")
map(keymaps.general.next_buffer, "<cmd>bnext<cr>")
