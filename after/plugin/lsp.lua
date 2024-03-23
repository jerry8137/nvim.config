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

require('lspconfig').clangd.setup({
  cmd = {
    'clangd',
    '--offset-encoding=utf-16'
  },
})

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}
local function get_clangd_cmd()
    local clangd_wrapper_path = vim.fn.getcwd() .. '/.clangd-wrapper'
    if vim.fn.filereadable(clangd_wrapper_path) == 1 then
        return {clangd_wrapper_path}
    else
        -- Fallback clangd command if .clangd-wrapper is not found
        return {'clangd'}
    end
end

require'lspconfig'.clangd.setup {
    cmd = get_clangd_cmd(),
    on_attach = function(client, bufnr)
        -- Optional: add here your preferred key mappings, completion setup, etc.
    end,
}
