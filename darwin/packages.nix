{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    neovim
    rustup
    gh
    bat
    bun
    imagemagick
    wget
    act
    utm
    ripgrep
    ffmpeg_7-full
  ];
}
