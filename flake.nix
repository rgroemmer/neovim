{
  description = "custom neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

    # all plugins that are not present in nixpkgs.vimPlugins need to be added here
    # they get directly fetched from git and build on the fly
    "yaml-companion" = { url = "github:someone-stole-my-name/yaml-companion.nvim"; flake = false; };
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

        config = import ./config.nix { inherit pkgs plugin; };

        # installs a vim plugin from git
        plugin = with pkgs; repo: vimUtils.buildVimPlugin {
          pname = "${lib.strings.sanitizeDerivationName repo}";
          version = "main";
          src = builtins.getAttr repo inputs;
        };
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
              start = startPlugins;
              opt = optPlugins;
            };
          };
        };
      }
    );
}
