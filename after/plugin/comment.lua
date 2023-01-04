require('nvim_comment').setup()

vim.keymap.set("n", "<C-_>", vim.cmd.CommentToggle)
