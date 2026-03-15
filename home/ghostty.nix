{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installBatSyntax = true;
    package = pkgs.ghostty-bin;
    settings = {
      macos-option-as-alt = true;
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 14;
      font-thicken = true;
      adjust-cell-height = 2;
      shell-integration-features = "sudo,ssh-env,no-title";
      window-padding-x = 8;
      window-padding-y = 8;
      theme = "One Double Dark";
    };
  };
}
