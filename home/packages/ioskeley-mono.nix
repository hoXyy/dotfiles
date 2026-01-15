{pkgs}:
pkgs.stdenvNoCC.mkDerivation rec {
  name = "ioskeley-mono";
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = "https://github.com/rohit-iwnl/IoskeleyMono/releases/download/2025.12.17-7/IoskeleyMono-NerdFont-Unhinted.zip";
    sha256 = "VwxZPWbzwtyUYp81E0b+JpmzbgKT/jdWf5jjqmRv9i0=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    install -d $out/share/fonts/truetype/NerdFonts/IoskeleyMono
    cp -r NerdFonts-Unhinted/*.{ttf,otf} $out/share/fonts/truetype/NerdFonts/IoskeleyMono

    runHook postInstall
  '';
}
