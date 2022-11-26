-- lsp config
-- updates while typing
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true,
})

--lsp keymaps
local function keymap(...) vim.keymap.set('n', ...) end

local opts = { noremap = true, silent = true }
--TODO: remap keys
keymap('<leader>rd', vim.diagnostic.open_float, opts)
keymap('<leader>rk', vim.diagnostic.goto_prev, opts)
keymap('<leader>rj', vim.diagnostic.goto_next, opts)
keymap('<leader>rl', vim.diagnostic.setloclist, opts)

local lsp_signature = require('lsp_signature')

require('lsp_signature').setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

local servers = { 'gopls', 'rnix', 'terraformls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
vim.o.completeopt = 'menu,menuone,noselect'
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- autoclose brackets
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})