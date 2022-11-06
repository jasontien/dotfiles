local Remap = require("jason.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>sv", ":so $MYVIMRC<CR>")

nnoremap("<leader>p",":NERDTreeToggle<CR>")

nnoremap("<leader>ff",":Telescope find_files<CR>")
nnoremap("<leader>fg",":Telescope live_grep<CR>")
nnoremap("<leader>fb",":Telescope buffers<CR>")
nnoremap("<leader>fh",":Telescope help_tags<CR>")
