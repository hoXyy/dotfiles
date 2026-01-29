{pkgs, ...}:
pkgs.writeShellScriptBin "setup-keyrepeat-for-vscode" ''
  set -e
  /usr/bin/defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
''
