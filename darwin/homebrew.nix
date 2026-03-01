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
      "zsh-async"
      "anomalyco/homebrew-tap/opencode"
      "tree-sitter-cli"
      "wasm-pack"
    ];

    casks = [
      "obs"
      "sikarugir"
      "db-browser-for-sqlite"
      "appcleaner"
      "docker-desktop"
      "mac-mouse-fix"
      "iina"
      "the-unarchiver"
      "parsec"
      "gimp"
      "transmission"
      "zed"
      "1password"
      "google-chrome"
      "visual-studio-code"
      "zen"
    ];
  };
}
