local map = vim.api.nvim_set_keymap

map('n', '<Space>wj', '<C-W><C-J>', {noremap = true})
map('n', '<Space>wk', '<C-W><C-K>', {noremap = true})
map('n', '<Space>wl', '<C-W><C-L>', {noremap = true})
map('n', '<Space>wh', '<C-W><C-H>', {noremap = true})
map('n', '<Space>wv', ':vsplit<CR>', {noremap = true})
map('n', '<Space>ws', ':split<CR>', {noremap = true})
map('n', '<Space>op', ':NvimTreeToggle<CR>', {noremap = true})
map('n', '<Space><Space>', ':FzfLua files<CR>', {noremap = true})
map('n', '<Space>/', ':FzfLua grep<CR>', {noremap = true})
map('n', '<Space>bi', ':FzfLua buffers<CR>', {noremap = true})
map('n', '<Space>gg', ':Neogit<CR>', {noremap = true})
