{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    plugins = [
      {
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "v1.26.0";
          sha256 = "1gah16673pzkbhkkiwh3rhcxzdkdnfy1z414r8qnl19sd0zv3501";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.8.0";
          sha256 = "1yl8zdip1z9inp280sfa5byjbf2vqh2iazsycar987khjsi5d5w8";
        };
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.1";
          sha256 = "02p5wq93i12w41cw6b00hcgmkc8k80aqzcy51qfzi0armxig555y";
        };
      }
      {
        name = "zsh-bat";
        src = pkgs.fetchFromGitHub {
          owner = "fdellwing";
          repo = "zsh-bat";
          rev = "467337613c1c220c0d01d69b19d2892935f43e9f";
          sha256 = "0sj8dwqlnd7dz7djs6kv92vsxqai2sc2pq865r7i5lxgjxk9hfsd";
        };
      }
      {
        name = "oh-my-zsh-git";
        src = pkgs.fetchFromGitHub {
          owner = "ohmyzsh";
          repo = "ohmyzsh";
          rev = "871d4b9816e6a8bdf809149c79f468d0fcb888db";
          sha256 = "03j0q3wh1v410asy9hzsjm95ixl87b7r3i8hv6sdlxxxa0irc1lc";
        };
        file = "plugins/git/git.plugin.zsh";
      }
      {
        name = "zsh-fzf-history-search";
        src = pkgs.fetchFromGitHub {
          owner = "joshskidmore";
          repo = "zsh-fzf-history-search";
          rev = "35df458f7d9478fa88c74af762dcd296cdfd485d";
          sha256 = "6UWmfFQ9JVyg653bPQCB5M4jJAJO+V85rU7zP4cs1VI=";
        };
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "01dad759c4466600b639b442ca24aebd5178e799";
          sha256 = "q26XVS/LcyZPRqDNwKKA9exgBByE0muyuNb0Bbar2lY=";
        };
      }
    ];
    history = {
      append = true;
      saveNoDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
      ignoreAllDups = true;
      findNoDups = true;
      size = 5000;
    };
    initContent = ''
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    '';
    shellAliases = {
      ls = "ls -l --color";
      lg = "lazygit";
      nix-rebuild = ''
        sudo darwin-rebuild switch --flake "git+file://$HOME/.config/nix?submodules=1#hoxi-mbp"'';
    };
  };
}
