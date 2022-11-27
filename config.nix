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
    nodePackages.typescript
    nodePackages.typescript-language-server

  ];
  startPlugins = with pkgs; [
    # lsp and autocompletion
    "nvim-lspconfig" # will be used from pkgs.vimPlugins
    "luasnip"
    "lsp_signature-nvim"
    "nvim-autopairs"
    "nvim-treesitter-context"

    "refactoring-nvim"
    "trouble-nvim"

    "plenary-nvim"

    "which-key-nvim"

    "nvim-web-devicons"

    "vim-smoothie" # smooth scroll

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
