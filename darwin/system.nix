{pkgs, ...}: {
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  system.primaryUser = "hoxi";

  networking.hostName = "hoxi-mbp";

  users.users.hoxi = {
    home = "/Users/hoxi";
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = false;
  };
}
