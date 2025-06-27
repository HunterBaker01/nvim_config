-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Highlighting
vim.opt.hlsearch = false

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Line breaks
vim.opt.linebreak = true

-- Window splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Allow syncing of clipboards
vim.o.clipboard = "unnamedplus"

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

vim.o.list = true
vim.opt.listchars = { trail = '·', nbsp = '␣' }
