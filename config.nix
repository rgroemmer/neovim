{ pkgs }: {
  extraPackages = with pkgs; [
    # utilities
    tree-sitter

    # language servers
    rnix-lsp
    gopls
    terraform-ls
    rust-analyzer
    nodePackages.yaml-language-server
  ];

  startPlugins = with pkgs; [
    # lsp and autocompletion
    "nvim-lspconfig" # will be used from pkgs.vimPlugins
    "nvim-cmp"
    "cmp-nvim-lsp"
    "cmp-path"
    "cmp-git"
    "cmp_luasnip"
    "luasnip"
    "lsp_signature-nvim"
    "nvim-autopairs"

    # snippets are needed for many language servers
    "cmp-vsnip"
    "vim-vsnip"
    "friendly-snippets" # snippet collection for all languages

    "earthly-vim" # will be built on the fly from inputs
    
    "onedark-nvim"

    "lualine-nvim"
    "bufferline-nvim"
    "indent-blankline-nvim"
    "comment-nvim"
    "nvim-surround"
    "nvim-tree-lua"
    "telescope-nvim"
  ];

  optPlugins = with pkgs; [

  ];

  # build neovim config
  neovimConfig = with pkgs.lib.strings; builtins.concatStringsSep "\n" [
    (fileContents config/config.vim)
    ''
      lua << EOF
        ${fileContents config/lsp.lua}
        ${fileContents config/plugins.lua}
      EOF
    ''
  ];
}