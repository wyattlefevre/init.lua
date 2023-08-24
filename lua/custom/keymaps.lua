local default_opts = {noremap = true, silent = true}
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<S-h>', "<C-w>h", default_opts)
vim.keymap.set('n', '<S-l>', "<C-w>l", default_opts)

-- Clear highlight (search) with esc
vim.keymap.set('n', '<ESC>', ':noh<CR>', default_opts)
