# hoxi's dotfiles repo

My dotfiles repo for macOS, handled by [nix-darwin](https://github.com/nix-darwin/nix-darwin/).

## Usage

Clone this repo to `~/.config/nix` *with submodules (using `--recurse-submodules`)*.

Install [Lix](https://lix.systems/install/#on-any-other-linuxmacos-system) (as recommended by nix-darwin).

Run this command to install nix-darwin:
```sh
sudo nix run nix-darwin/master#darwin-rebuild -- switch
```

Then for the first time run:
```sh
sudo darwin-rebuild switch --flake $HOME/.config/nix#hoxi-mbp
```

to build the config.

Afterwards you can just run:
```sh
nix-rebuild
```

to do the same.
