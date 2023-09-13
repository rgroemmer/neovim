{ pkgs }: {
  extraPackages = with pkgs; [
    # lsp tools 
    gopls
    gotools
    golangci-lint-langserver
    rnix-lsp
    terraform-ls
    rust-analyzer
    nodePackages.yaml-language-server
    nodejs
    # plugin pkgs
    tree-sitter
    python39
    sqlite
    fzf
    bat
    ripgrep
  ];

  startPlugins = with pkgs.vimPlugins; [
    onedark-vim
    # lsp-plugins
    nvim-lspconfig
    lsp_signature-nvim
    # intelli-sense
    nvim-cmp
    cmp-nvim-lsp
    cmp-path
    cmp-buffer
    cmp-cmdline
    cmp-git
    # snippet manager
    cmp-nvim-ultisnips
    ultisnips
    vim-snippets
    cmp-vsnip
    vim-vsnip
    friendly-snippets
    # default plugins
    nvim-tree-lua
    nvim-treesitter.withAllGrammars
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
        ${fileContents config/init.lua}
        ${fileContents config/treesitter.lua}
        ${fileContents config/telescope.lua}
        ${fileContents config/lsp.lua}
        ${fileContents config/cmp.lua}
        ${fileContents config/plugins.lua}
        ${fileContents config/which-key.lua}
      EOF
    ''
  ];
}
