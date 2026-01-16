{pkgs, ...}: let
  wallpaper = ../../configs/wallpaper.jpeg;
in
  pkgs.writeShellScriptBin "set-wallpaper-script" ''
    set -e
    /usr/bin/osascript -e "tell application \"System Events\" to set picture of every desktop to POSIX file \"${wallpaper}\""
  ''
