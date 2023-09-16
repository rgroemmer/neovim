{ pkgs }: {
  extraPackages = with pkgs; [
    # lsp tools 
    gopls
    gotools
    golangci-lint-langserver
    rnix-lsp
    terraform-ls
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
    nvim-web-devicons
    nvim-treesitter.withAllGrammars
    which-key-nvim
    nvim-autopairs
    bufferline-nvim
    lualine-nvim
    plenary-nvim
    telescope-nvim
    vim-illuminate
  ];

  optPlugins = with pkgs; [
  ];

  # build neovim config
  neovimConfig = with pkgs.lib.strings; builtins.concatStringsSep "\n" [
    (fileContents config/vim/config.vim)
    (fileContents config/vim/better_escape.vim)
    ''
      lua << EOF
        ${fileContents config/init.lua}
        ${fileContents config/core/lsp.lua}
        ${fileContents config/core/treesitter.lua}
        ${fileContents config/core/cmp.lua}
        ${fileContents config/core/keymap.lua}
        ${fileContents config/plugins/plugins.lua}
        ${fileContents config/core/which-key.lua}
      EOF
    ''
  ];
}
