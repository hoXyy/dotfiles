{pkgs, ...}: let
  wallpaper = ../../configs/wallpaper2.png;
in
  pkgs.writeShellScriptBin "set-wallpaper-script" ''
    set -e
    /usr/bin/osascript -e "tell application \"System Events\" to set picture of every desktop to POSIX file \"${wallpaper}\""
  ''
