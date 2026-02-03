{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
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
  ];
}
