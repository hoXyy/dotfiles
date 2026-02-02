{
  config,
  pkgs,
  lib,
  ...
}: let
  extensions = [
    "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
    "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1Password
    "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
    "fmkadmapgofadopljbjfkapdkoienihi" # React DevTools
    "nhdogjmejiglipccpnnnanhbledajbpd" # Vue DevTools
    "fadndhdgpmmaapbmfcknlfgcflmmmieb" # FrankerFaceZ
    "jiaopdjbehhjgokpphdfgmapkobbnmjp" # Youtube-shorts block
    "fkagelmloambgokoeokbpihmgpkbgbfm" # Indie Wiki Buddy
    "kdbmhfkmnlmbkgbabkdealhhbfhlmmon" # SteamDB
    "hlepfoohegkhhmjieoechaddaejaokhf" # Refined GitHub
  ];

  mkExtensionsList = id: {
    name = "Library/Application Support/Google/Chrome/External Extensions/${id}.json";
    value = {
      text = ''
        {
            "external_update_url": "https://clients2.google.com/service/update2/crx"
        }
      '';
    };
  };
in {
  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
  };

  home.file = builtins.listToAttrs (map mkExtensionsList extensions);
}
