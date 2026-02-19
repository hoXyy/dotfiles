{
  description = "hoxi's nix config for macOS";

  inputs = {
    # Neovim config is a submodule so need to enable this
    # Actually Lix has a broken experimental feature on the CLI which means I can't use this :)
    #self.submodules = true;

    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # nix-darwin
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # home-manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nix-homebrew
    homebrew.url = "github:zhaofengli/nix-homebrew";

    # homebrew taps
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    homebrew-sikarugir = {
      url = "github:Sikarugir-App/homebrew-sikarugir";
      flake = false;
    };

    homebrew-opencode = {
      url = "github:anomalyco/homebrew-tap";
      flake = false;
    };

    # VSCode extensions
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    homebrew,
    homebrew-core,
    homebrew-cask,
    homebrew-sikarugir,
    homebrew-opencode,
    nix-vscode-extensions,
    ...
  }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#hoxi-mbp
    darwinConfigurations."hoxi-mbp" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";

      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        config.allowUnfree = true;
        overlays = [
          nix-vscode-extensions.overlays.default
        ];
      };

      specialArgs = {
        inherit inputs;
      };

      modules = [
        homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;

            # Enable Rosetta on Apple Silicon
            enableRosetta = true;

            user = "hoxi";

            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "sikarugir-app/homebrew-sikarugir" = homebrew-sikarugir;
              "anomalyco/homebrew-tap" = homebrew-opencode;
            };

            mutableTaps = false;
          };
        }

        ({config, ...}: {
          homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
        })

        ./darwin

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.hoxi = import ./home;
        }
      ];
    };
  };
}
