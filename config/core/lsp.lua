local lspconfig = require('lspconfig')
local caps = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(caps)
local util = require "lspconfig/util"

-- Navic used to get the actual file path of cursor
local navic = require("nvim-navic")
navic.setup{
  lsp = {
    auto_attach = true;
  },
}
-- Display filepath on top-line
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>fa', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<space>ea', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    -- attach navic if capabilities met
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

local servers = {
  gopls = {
    cmd = {"gopls"},
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        gofumpt = true,
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  },
  rnix = {},
  terraformls = {},
  rust_analyzer = {},
  yamlls = {},
}

for key, value in pairs(servers) do
  lspconfig[key].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = value.cmd,
    filetypes = value.filetypes,
    settings = value.settings,
    root_dir = value.root_dir,
  }
end

