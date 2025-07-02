vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Execute the entire file using runpy
vim.keymap.set('n', '<c-x>', [[
  :!python -c "import sys; sys.path = ['.'] + sys.path; import runpy; runpy.run_path('%')"<CR>
]], { desc = "Execute File with runpy" })

-- Execute the entire file using standard python
vim.keymap.set('n', '<leader>x', [[
  :!python %<CR>
]], { desc = "Execute File" })

-- Send selected code to Python (using :w !python)
vim.keymap.set('x', '<leader>r', [[
  :w !python<CR>
]], { desc = "Send selection to Python" })
vim.keymap.set('n', '<leader>r', [[
  :w !python<CR>
]], { desc = "Send current line to Python" })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

