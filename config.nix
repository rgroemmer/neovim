{ pkgs }: {
  extraPackages = with pkgs; [
    # utilities
    tree-sitter

    # language servers
    rnix-lsp
    gopls
    terraform-ls
    rust-analyzer
    nodejs
    nodePackages.yaml-language-server
    nodePackages.typescript
    nodePackages.typescript-language-server
    python39
    sqlite
    golangci-lint
  ];
  startPlugins = with pkgs; [
    "onedark-nvim"        # theme
    "nvim-tree-lua"       # explorer
    "nvim-lspconfig"      # lsp-config
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
