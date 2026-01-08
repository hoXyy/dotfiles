{config, ...}: {
  xdg.configFile."nvim" = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/configs/nvim-config";
    recursive = true;
    force = true;
  };
}
