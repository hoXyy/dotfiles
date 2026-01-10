{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # Only include apps defined in this config file
      cleanup = "zap";
    };

    masApps = {
      Xcode = 497799835;
      WireGuard = 1451685025;
    };

    brews = [
      "act"
      "gh"
      "lazygit"
      "wget"
      "btop"
      "zsh-async"
      "opencode"
    ];

    casks = [
      "obs"
      "sikarugir"
      "utm"
      "db-browser-for-sqlite"
      "appcleaner"
      "docker-desktop"
      {
        name = "visual-studio-code";
        greedy = true;
      }
      "mac-mouse-fix"
      {
        name = "helium-browser";
        greedy = true;
      }
      "iina"
      "the-unarchiver"
      "1password"
      "parsec"
      "gimp"
      "transmission"
    ];
  };
}
