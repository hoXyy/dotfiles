{pkgs, ...}:
pkgs.writeShellScriptBin "disable-apple-intelligence" ''
  set -e
  /usr/bin/defaults write com.apple.CloudSubscriptionFeatures.optIn "545129924" -bool "true"
''
