{ pkgs, plugin }: {
  extraPackages = with pkgs; [
    # language server
    gopls
    golangci-lint-langserver
    rnix-lsp
    terraform-ls
    lua-language-server
    nodePackages.yaml-language-server
    nodePackages.bash-language-server
    helm-ls
    ansible-language-server
    # tooling
    nodejs
    gotools
    # plugin pkgs
    tree-sitter
    python39
    sqlite
    fzf
    bat
    ripgrep
  ];

  startPlugins = with pkgs.vimPlugins; [
    # colorscheme
    tokyonight-nvim

    # lsp-plugins
    nvim-lspconfig
    lsp_signature-nvim

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
    lazygit-nvim
    wilder-nvim
    indent-blankline-nvim

    # intelli-sense
    nvim-cmp
    cmp-nvim-lsp
    cmp-path
    cmp-buffer
    cmp-cmdline
    cmp-git

    # snippet manager
    vim-snippets
    cmp-vsnip
    vim-vsnip
    friendly-snippets

    # plugins via git
    (plugin "yaml-companion")
    nvim-navic
  ];

  optPlugins = with pkgs; [
  ];

  # build neovim config
  neovimConfig = with pkgs.lib.strings; builtins.concatStringsSep "\n" [
    (fileContents config/vim/better_escape.vim)
    (fileContents config/vim/config.vim)
    ''
      lua << EOF
        -- Core configuration
        ${fileContents config/core/init.lua}
        ${fileContents config/core/autocmds.lua}
        ${fileContents config/core/theme.lua}
        ${fileContents config/core/lsp.lua}
        ${fileContents config/core/treesitter.lua}
        ${fileContents config/core/cmp.lua}
        ${fileContents config/core/diagnostics.lua}
        ${fileContents config/core/mappings.lua}

        -- Plugin configuration
        ${fileContents config/plugins/bufferline.lua}
        ${fileContents config/plugins/indent-blankline.lua}
        ${fileContents config/plugins/lualine.lua}
        ${fileContents config/plugins/miscellaneous.lua}
        ${fileContents config/plugins/nvim-tree.lua}
        ${fileContents config/plugins/wilder-menu.lua}
        ${fileContents config/plugins/yaml-companion.lua}

        -- Load at last
        ${fileContents config/core/which-key.lua}
      EOF
    ''
  ];
}
