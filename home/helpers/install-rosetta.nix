{pkgs, ...}:
pkgs.writeShellScriptBin "install-rosetta" ''
  set -e
  if /usr/bin/pgrep -q oahd; then
    echo "Rosetta is already installed"
    exit 0
  fi

  if arch -x86_64 /usr/bin/true 2>/dev/null; then
    echo "Rosetta is already installed"
    exit 0
  fi

  /usr/sbin/softwareupdate --install-rosetta --agree-to-license
''
