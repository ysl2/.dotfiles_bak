vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.api.nvim_set_keymap('i', '<C-c>', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '>>', '>>^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<<', '<<^', {noremap = true, silent = true})

