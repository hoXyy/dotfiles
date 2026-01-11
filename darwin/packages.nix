{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    discord
    ghostty-bin
    rustup
    gh
    fzf
    bat
    bun
  ];
}
