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
    # TODO handle dependencies?
    "coq_nvim"
    "coq-artifacts"
    "coq-thirdparty"
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
  
}
