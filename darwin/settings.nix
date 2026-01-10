{
  system.defaults = {
    ".GlobalPreferences" = {
      "com.apple.mouse.scaling" = -1.0;
    };
    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleInterfaceStyle = "Dark";
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      NSAutomaticDashSubstitutionEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
    };
    finder = {
      AppleShowAllFiles = true;
      NewWindowTarget = "Computer";
      ShowPathbar = true;
      ShowHardDrivesOnDesktop = true;
      _FXSortFoldersFirst = true;
    };
    loginwindow = {
      GuestEnabled = false;
    };
    menuExtraClock = {
      ShowSeconds = true;
    };
    screencapture = {
      target = "clipboard";
    };
    SoftwareUpdate = {
      AutomaticallyInstallMacOSUpdates = false;
    };
    WindowManager = {
      EnableStandardClickToShowDesktop = false;
    };
    controlcenter = {
      BatteryShowPercentage = true;
      Sound = true;
      Bluetooth = true;
    };
    dock = {
      autohide = false;
      mineffect = "scale";
      persistent-apps = [
        "/Applications/Helium.app"
        "/System/Applications/Messages.app"
        "/Applications/Nix Apps/Discord.app"
        "/System/Applications/Mail.app"
        "/System/Applications/Calendar.app"
        "/System/Applications/Music.app"
        "/Applications/Visual Studio Code.app"
        "/Applications/Nix Apps/Ghostty.app"
        "/System/Applications/System Settings.app"
        "/Applications/UTM.app"
      ];
      tilesize = 42;
    };
  };

  security.pam = {
    services = {
      sudo_local = {
        # Enable touch ID for sudo
        touchIdAuth = true;
      };
    };
  };
}
