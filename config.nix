{ pkgs }: {
  extraPackages = with pkgs; [
    gopls
    golangci-lint-langserver
    rnix-lsp
    terraform-ls
    rust-analyzer
    nodePackages.yaml-language-server
    nodejs

    tree-sitter
    python39
    sqlite

    fzf
    bat
    ripgrep
  ];

  startPlugins = with pkgs.vimPlugins; [
    onedark-nvim
    nvim-tree-lua      # explorer
    nvim-lspconfig      # lsp-config

    nvim-treesitter.withAllGrammars

    lsp_signature-nvim

    which-key-nvim
    nvim-autopairs
    bufferline-nvim
    lualine-nvim
    indent-blankline-nvim

    plenary-nvim
    telescope-nvim

    nvim-ts-rainbow 
    vim-illuminate
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
