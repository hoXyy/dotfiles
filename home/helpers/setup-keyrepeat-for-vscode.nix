{pkgs, ...}:
pkgs.writeShellScriptBin "setup-keyrepeat-for-vscode" ''
  set -e
  /usr/bin/defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
  /usr/bin/defaults write com.todesktop.230313mzl4w4u92 ApplePressAndHoldEnabled -bool false
''
