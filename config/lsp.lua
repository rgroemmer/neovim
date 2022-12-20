-- this part is telling Neovim to use the lsp server
--local servers = { 'terraformls', 'gopls', 'rnix', 'tsserver', 'rust_analyzer' }
local servers = { 'gopls' };
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
    }
end
