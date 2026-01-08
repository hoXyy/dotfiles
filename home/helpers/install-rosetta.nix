{pkgs, ...}:
pkgs.writeShellScriptBin "install-rosetta" ''
  set -e
  /usr/sbin/softwareupdate --install-rosetta
''
