{config, ...}: {
  xdg.configFile."zed" = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/configs/zed";
    recursive = true;
    force = true;
  };
}
