{pkgs}:
pkgs.stdenv.mkDerivation {
  pname = "nvm";
  version = "0.40.3";
  src = pkgs.fetchFromGitHub {
    owner = "nvm-sh";
    repo = "nvm";
    rev = "v0.40.3";
    sha256 = "0flfx69r1hzx92590b8w7k7yfxny89crwx4dqywajd77i1188zmk";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/nvm
    cp -r . $out/share/nvm
  '';
}
