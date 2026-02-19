{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    neovim
    ghostty-bin
    rustup
    gh
    fzf
    bat
    bun
    imagemagick
    wget
    act
    utm
    ripgrep
  ];
}
