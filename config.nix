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
    "onedark-nvim"

    # completion
    "nvim-cmp"
    "cmp-nvim-lsp"
    "cmp-path"
    "cmp-git"
    "lsp_signature-nvim"

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