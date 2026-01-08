{pkgs, ...}: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    settings.user = {
      name = "Paweł Zatoka";
      email = "github@hoxi.me";
    };
  };
}
