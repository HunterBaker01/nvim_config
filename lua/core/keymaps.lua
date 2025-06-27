-- Change the leader key to the space bar
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Changing the escape key to jk or kj in insert mode
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', 'kj', '<ESC>')


-- Movement between windows
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Resizing windows
vim.keymap.set('n', '<Up>', ':resize -2<CR>')
vim.keymap.set('n', '<Down>', ':resize +2<CR>')
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>')
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>')

-- Tabs
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Easier Save
vim.keymap.set('n', 'ss', ':w<CR>')

-- Searching
vim.keymap.set('n', '<leader>no', vim.cmd.nohlsearch)

-- Buffer
vim.keymap.set('n', '<TAB>', ':bn<CR>')
vim.keymap.set('n', '<S-TAB>', ':bp<CR>')
vim.keymap.set('n', '<leader>x', ':bd<CR>')

-- Splitting
vim.keymap.set('n', '<leader>v', '<C-w><C-v>')
vim.keymap.set('n', '<leader>h', '<C-w><C-s>')
vim.keymap.set('n', '<leader>=', '<C-w>=')

-- Terminal
vim.keymap.set('t', 'jk', '<C-\\><C-N>')
vim.keymap.set('t', 'kj', '<C-\\><C-N>')
vim.keymap.set('n', '<leader>t', ':terminal<CR>')
