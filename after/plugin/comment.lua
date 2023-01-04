require('nvim_comment').setup()

vim.keymap.set("n", "<C-_>", vim.cmd.CommentToggle)
vim.keymap.set("v", "<C-_>", ":'<,'>CommentToggle<CR>")
