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

require'lspconfig'.clangd.setup {
    cmd = { "/bin/bash", "-c", [[
    docker exec \
        --interactive \
        --workdir /home/jerry/codespace/sdc/ros \
        sdc-bionic \
        clangd-12 $@
    ]] },
    on_attach = function(client, bufnr)
        -- Optional: add here your preferred key mappings, completion setup, etc.
    end,
}

