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
      Wireguard = 1451685025;
    };

    brews = [
      "act"
      "gh"
      "wget"
      "btop"
      "zsh-async"
      "anomalyco/homebrew-tap/opencode"
      "tree-sitter-cli"
    ];

    casks = [
      "obs"
      "sikarugir"
      "utm"
      "db-browser-for-sqlite"
      "appcleaner"
      "docker-desktop"
      "mac-mouse-fix"
      "iina"
      "the-unarchiver"
      "1password"
      "parsec"
      "gimp"
      "transmission"
      "zed"
    ];
  };
}
