# hoxi's dotfiles repo

My dotfiles repo for macOS, handled by [nix-darwin](https://github.com/nix-darwin/nix-darwin/).

## Usage

Clone this repo to `~/.config/nix` *with submodules (using `--recurse-submodules`)*.

Install [Lix](https://lix.systems/install/#on-any-other-linuxmacos-system) (as recommended by nix-darwin).

Run this command to install nix-darwin and the config:
```sh
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake "git+file://$HOME/.config/nix?submodules=1#hoxi-mbp"
```

Afterwards you can just run:
```sh
nix-rebuild
```
or
```sh
sudo darwin-rebuild switch --flake "git+file://$HOME/.config/nix?submodules=1#hoxi-mbp"
```

to do the same.
