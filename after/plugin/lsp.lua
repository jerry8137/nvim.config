local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {tinymist},
  handlers = {
    lsp_zero.default_setup,
  },
})

require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
    },
  },
}
local function get_clangd_cmd()
  local clangd_wrapper_path = vim.fn.getcwd() .. '/.clangd-wrapper'
  if vim.fn.filereadable(clangd_wrapper_path) == 1 then
    return { clangd_wrapper_path }
  else
    -- Fallback clangd command if .clangd-wrapper is not found
    return { 'clangd' }
  end
end

require 'lspconfig'.clangd.setup {
  cmd = get_clangd_cmd(),
  on_attach = function(client, bufnr)
    -- Optional: add here your preferred key mappings, completion setup, etc.
  end,
}

local function get_ruff_cmd()
  local ruff_wrapper_path = vim.fn.getcwd() .. '/.ruff-wrapper'
  local pylsp_wrapper_path = vim.fn.getcwd() .. '/.pylsp-wrapper'
  if vim.fn.filereadable(ruff_wrapper_path) == 1 then
    return { ruff_wrapper_path }
  elseif vim.fn.filereadable(pylsp_wrapper_path) == 1 then
    return { pylsp_wrapper_path }
  else
    -- Fallback clangd command if .clangd-wrapper is not found
    return { 'pylsp' }
  end
end
require 'lspconfig'.pylsp.setup {
  cmd = get_ruff_cmd(),
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        black = { enabled = false },
        autopep8 = { enabled = false },
        yapf = {
          enabled = true,
          -- YAPF line length setting
          args = { '--style', '{column_limit: 79}' }
        },
        -- linter options
        pylint = { enabled = true, executable = "pylint",
          -- Pylint line length setting
          args = { '--max-line-length=200' } },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        -- type checker
        pylsp_mypy = { enabled = true },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        pyls_isort = { enabled = true },

      }
    }
  }
}
