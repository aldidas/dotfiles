local g = vim.g
g.t_Co = 256
g.background = "dark"
g.mapleader = ','

g['prettier#config#config_precedence'] = "file-override"
g['prettier#config#tab_width'] = 2
g['prettier#config#use_tabs'] = false
g['prettier#config#single_quote'] = true
g['prettier#config#semi'] = false
g['prettier#config#bracker_spacing'] = true
g['prettier#config#jsx_bracket_same_line'] = true
g['prettier#config#trailing_comma'] = "none"
g['prettier#config#arrow_parens'] = "avoid"

local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path
