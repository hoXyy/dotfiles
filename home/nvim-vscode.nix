{config, ...}: {
  xdg.configFile."nvim-vscode" = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nix/configs/nvim-vscode";
    recursive = true;
    force = true;
  };
}
