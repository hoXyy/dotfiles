{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    neovim
    discord
    ghostty-bin
    rustup
    gh
    fzf
    bat
    bun
  ];
}
