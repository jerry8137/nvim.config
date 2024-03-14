local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

-- require('lspconfig').clangd.setup({
--   cmd = {
--     'clangd',
--     '--offset-encoding=utf-16'
--   },
-- })

vim.cmd [[
set exrc
set secure
]]
vim.g.ale_linters = {
    cpp = { 'clangd' }
}
vim.g.ale_cpp_clangd_executable = vim.fn.getcwd() .. "/.clangd-wrapper"

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>ad', ':ALEDetail<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ah', ':ALEHover<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ag', ':ALEGoToDefinition<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ap', ':ALEPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>an', ':ALENext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>as', ':ALESymbolSearch<CR>', { noremap = true, silent = true })
