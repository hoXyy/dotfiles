{pkgs, ...}: {
  programs.discord = {
    enable = true;
    package = pkgs.discord.override {
      withOpenASAR = true;
    };
    settings = {
      DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOURE_DOING = true;
    };
  };
}
