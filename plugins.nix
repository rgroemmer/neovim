{ pkgs }: {
  extraPackages = with pkgs; [
    # utilities
    tree-sitter

    # language servers
    rnix-lsp
  ];

  startPlugins = with pkgs; [
    "nvim-lspconfig" # will be used from pkgs.vimPlugins
    "earthly-vim" # will be built on the fly from inputs
    "coq-vim"
    "onedark-nvim"
    "lualine-nvim"
    "bufferline-nvim"
    "indent-blankline-nvim"
  ];

  optPlugins = with pkgs; [

  ];
  
}