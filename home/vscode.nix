{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.runCommand "vscode-dummy" {
      pname = "vscode";
      version = "1.0.0";
    } "mkdir -p $out/bin; ln -s /usr/bin/true $out/bin/code";

    mutableExtensionsDir = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-marketplace; [
          dbaeumer.vscode-eslint
          eamodio.gitlens
          chaitanyashahare.lazygit
          vscodevim.vim
          bbenoist.nix
          esbenp.prettier-vscode
          catppuccin.catppuccin-vsc
          vitest.explorer
          orta.vscode-jest
          yoavbls.pretty-ts-errors
          ms-azuretools.vscode-docker
          astro-build.astro-vscode
        ];

        userSettings = {
          # Editor settings
          "editor.cursorBlinking" = "smooth";
          "editor.fontLigatures" = true;
          "editor.fontFamily" = "\"MesloLGL Nerd Font\", Menlo, Monaco, 'Courier New', monospace";
          "editor.lineNumbers" = "relative";
          "editor.codeActionsOnSave" = {
            "source.fixAll.eslint" = "explicit";
          };
          "workbench.colorTheme" = "Catppuccin Frappé";

          # VSCode Vim
          "extensions.experimental.affinity" = {
            "vscodevim.vim" = 1;
          };
          "vim.leader" = "<space>";
          "vim.useSystemClipboard" = true;
          "vim.highlightedyank.enable" = true;
          "vim.smartRelativeLine" = true;
          "vim.overrideCopy" = true;
          "vim.hlsearch" = true;
          "vim.surround" = true;
          "vim.insertModeKeyBindings" = [
            {
              "before" = ["j" "k"];
              "after" = ["<Esc>"];
            }
          ];
          "vim.normalModeKeyBindingsNonRecursive" = [
            {
              "before" = ["g" "d"];
              "commands" = [""];
            }
            {
              "before" = ["g" "y"];
              "commands" = [""];
            }
            {
              "before" = ["c" "d"];
              "commands" = [""];
            }
            {
              "before" = ["g" "r" "d"];
              "commands" = ["editor.action.revealDefinition"];
            }
            {
              "before" = ["g" "r" "D"];
              "commands" = ["editor.action.revealDeclaration"];
            }
            {
              "before" = ["g" "r" "n"];
              "commands" = ["editor.action.rename"];
            }
            {
              "before" = ["g" "r" "t"];
              "commands" = ["editor.action.goToTypeDefinition"];
            }
            {
              "before" = ["g" "O"];
              "commands" = ["workbench.action.goToSymbol"];
            }
            {
              "before" = ["g" "W"];
              "commands" = ["workbench.action.showAllSymbols"];
            }
            {
              "before" = ["g" "r" "r"];
              "commands" = ["editor.action.goToReferences"];
            }
            {
              "before" = ["leader" "s" "f"];
              "commands" = ["workbench.action.quickOpen"];
            }
            {
              "before" = ["leader" "f"];
              "commands" = ["editor.action.formatDocument"];
            }
            {
              "before" = ["leader" "e"];
              "commands" = ["workbench.action.toggleSidebarVisibility"];
            }
            {
              "before" = ["leader" "t" "h"];
              "commands" = ["editor.action.toggleInlayHints"];
            }
            {
              "before" = ["leader" "t" "p"];
              "commands" = ["workbench.actions.view.problems"];
            }
            {
              "before" = ["leader" "l" "g"];
              "commands" = ["lazygit.openLazygit"];
            }
            {
              "before" = ["K"];
              "commands" = ["editor.action.showHover"];
            }
          ];
        };

        userTasks = {};
      };
    };
  };
}
