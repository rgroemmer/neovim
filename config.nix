{ pkgs }: {
  extraPackages = with pkgs; [
    gopls
    golangci-lint
    rnix-lsp
    terraform-ls
    rust-analyzer

    tree-sitter
    python39
    sqlite
  ];

  startPlugins = with pkgs; [
    "onedark-nvim"        # theme
    "nvim-tree-lua"       # explorer
    "nvim-lspconfig"      # lsp-config

    "coq_nvim"
    "coq-artifacts"
    "coq-thirdparty"

    "which-key-nvim"
    "nvim-autopairs"
    "bufferline-nvim"
    "lualine-nvim"
    "indent-blankline-nvim"
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
