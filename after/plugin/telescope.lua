local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>p2', function()
  -- Get the directory of current buffer
  local buffer_dir = utils.buffer_dir()
  -- Go up two directory levels
  local parent_dir = vim.fn.fnamemodify(buffer_dir, ':h:h')

  builtin.find_files({
    cwd = parent_dir,
    prompt_title = "Find Files (.. from buffer)",
  })
end, {
  desc = "Find files two directories up from current buffer"
})
