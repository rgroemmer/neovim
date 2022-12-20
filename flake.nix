{
  description = "custom neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

    # all plugins that are not present in nixpkgs.vimPlugins need to be added here
    # they get directly fetched from git and build on the fly
    "earthly-vim" = { url = "github:earthly/earthly.vim"; flake = false; };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    {
      # make it easy to use this flake as an overlay
      overlay = final: prev: {
        neovim = self.packages.${prev.system}.default;
      };
    } //
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          # enable all packages
          config = { allowUnfree = true; };
        };

        config = import ./config.nix { inherit pkgs; };

        # installs a vim plugin from git
        plugin = with pkgs; repo: vimUtils.buildVimPluginFrom2Nix {
          pname = "${lib.strings.sanitizeDerivationName repo}";
          version = "main";
          src = builtins.getAttr repo inputs;
        };

        # uses plugin from vimPlugins or builds it from inputs if not found
        pluginMapper = with pkgs; plugins: map
          (name: if lib.hasAttr name vimPlugins then lib.getAttr name vimPlugins else (plugin name))
          plugins;
      in
      with config; with pkgs; rec {
        apps.default = flake-utils.lib.mkApp {
          drv = packages.default;
          exePath = "/bin/nvim";
        };

        packages.default = wrapNeovim neovim-unwrapped {
          viAlias = true;
          vimAlias = true;
          withPython3 = true;
          withNodeJs = true;
          withRuby = true;
          extraMakeWrapperArgs = ''--prefix PATH : "${lib.makeBinPath extraPackages}"'';
          configure = {
            # import your individual vim config files here
            # you can import from files
            # or directly add the config here as a string
            customRC = neovimConfig;
            packages.myVimPackage = with vimPlugins; {
              start = pluginMapper startPlugins ++ [
                (nvim-treesitter.withPlugins (plugins: tree-sitter.allGrammars))
              ];
              opt = pluginMapper optPlugins;
            };
          };
        };
      }
    );
}
