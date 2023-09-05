{ pkgs }: {
  extraPackages = with pkgs; [
  ];

  startPlugins = with pkgs.vimPlugins; [
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
