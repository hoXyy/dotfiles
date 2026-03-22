{config, ...}: {
  xdg.configFile."wezterm" = {
    enable = true;
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/configs/wezterm";
  };
}
