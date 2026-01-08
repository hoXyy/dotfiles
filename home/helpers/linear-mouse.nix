{pkgs, ...}:
pkgs.writeShellScriptBin "linear-mouse" ''
  set -e
  /usr/bin/defaults write NSGlobalDomain com.apple.mouse.linear -bool "true"
''
