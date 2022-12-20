{ pkgs }: {
  extraPackages = with pkgs; [

  ];

  startPlugins = with pkgs; [
    "onedark-nvim"        # theme
    "nvim-tree-lua"       # explorer
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
