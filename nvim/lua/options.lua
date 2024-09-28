vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'

vim.o.number = true
-- vim.o.relativenumber = true

vim.o.signcolumn = 'yes'
vim.o.pumheight = 18

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = 'a'

vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.list = true
vim.lsp.inlay_hint.enable(true)

--Custom keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc = 'Clear search highlight'})
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<CR>', {desc = '[t]ab [n]ew'})
