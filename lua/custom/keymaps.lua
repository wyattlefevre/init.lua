local default_opts = { noremap = true, silent = true }
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Switch panes
vim.keymap.set('n', '<S-h>', "<C-w>h", default_opts)
vim.keymap.set('n', '<S-l>', "<C-w>l", default_opts)
vim.keymap.set('n', '<C-k>', "<C-w>k", default_opts)
vim.keymap.set('n', '<C-j>', "<C-w>j", default_opts)

-- Close pane
vim.keymap.set('n', '<C-w>', ':close<CR>', default_opts)

-- Vertical Split
vim.keymap.set("n", "<C-v>", "<C-w>v", default_opts)
vim.keymap.set("n", "<C-c>l", "<C-w>v<C-w>l<C-w>l:close<CR><C-w>h", default_opts)
vim.keymap.set("n", "<C-c>h", "<C-w>v<C-w>h<C-w>h:close<CR><C-w>l", default_opts)

-- Horizontal Split
vim.keymap.set("n", "<C-h>", "<C-w>s", default_opts)

-- Clear highlight (search) with esc
vim.keymap.set('n', '<ESC>', ':noh<CR>', default_opts)

-- Center screen on vertical movement
vim.keymap.set('n', '<C-d>', '<C-d>zz', default_opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', default_opts)
vim.keymap.set('v', '<C-d>', '<C-d>zz', default_opts)
vim.keymap.set('v', '<C-u>', '<C-u>zz', default_opts)

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set('n', 'G', 'Gzz')
vim.keymap.set('n', '<CR>', 'zz')

-- Refresh buffer
vim.keymap.set('n', '<leader>rb', ':e!<CR>')

vim.keymap.set('n', '<leader>p', ':let @+ = expand(\'%\')<CR>')

-- Exit Terminal mode with ESC
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

