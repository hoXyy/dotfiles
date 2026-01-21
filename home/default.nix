{
  pkgs,
  lib,
  ...
}: let
  nvm = import ./packages/nvm.nix {inherit pkgs;};
  neovim-stable = import ./packages/neovim-stable.nix {inherit pkgs;};
  setWallpaperScript = import ./helpers/wallpaper.nix {inherit pkgs;};
  linearMouseScript = import ./helpers/linear-mouse.nix {inherit pkgs;};
  disableAppleIntelligence = import ./helpers/disable-apple-intelligence.nix {inherit pkgs;};
  setupKeyrepeatForVSCode = import ./helpers/setup-keyrepeat-for-vscode.nix {inherit pkgs;};
  installRosetta = import ./helpers/install-rosetta.nix {inherit pkgs;};
  ioskeley-mono = import ./packages/ioskeley-mono.nix {inherit pkgs;};
in {
  home.stateVersion = "25.11";

  home.file.".nvm/nvm.sh".source = "${nvm}/share/nvm/nvm.sh";

  home.packages = with pkgs; [
    nvm
    alejandra
    neovim-stable
    ioskeley-mono
    nerd-fonts.meslo-lg
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
  ];

  home.activation = {
    "setWallpaper" = lib.hm.dag.entryAfter ["revealHomeLibraryDirectory"] ''
      echo "Setting wallpaper..."
      ${setWallpaperScript}/bin/set-wallpaper-script
    '';

    "disableMouseAcceleration" = lib.hm.dag.entryAfter ["setWallpaper"] ''
      echo "Disabling mouse acceleration..."
      ${linearMouseScript}/bin/linear-mouse
    '';

    "disableAppleIntelligence" = lib.hm.dag.entryAfter ["disableMouseAcceleration"] ''
      echo "Disabling Apple Intelligence..."
      ${disableAppleIntelligence}/bin/disable-apple-intelligence
    '';

    "installRosetta" = lib.hm.dag.entryAfter ["disableAppleIntelligence"] ''
      echo "Installing Rosetta..."
      ${installRosetta}/bin/install-rosetta
    '';

    "setupKeyrepeatForVSCode" = lib.hm.dag.entryAfter ["installRosetta"] ''
      echo "Setting up keyrepeat for VSCode..."
      ${setupKeyrepeatForVSCode}/bin/setup-keyrepeat-for-vscode
    '';
  };

  xdg.enable = true;

  imports = [
    ./zsh.nix
    ./nvim.nix
    ./git.nix
    ./ghostty.nix
  ];
}
