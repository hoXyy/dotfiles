{pkgs}:
pkgs.symlinkJoin {
  name = "neovim-stable";
  paths = [pkgs.neovim];
  postBuild = ''
    rm $out/bin/nvim
    ln -s ${pkgs.neovim}/bin/nvim $out/bin/nvim-stable
  '';
}
