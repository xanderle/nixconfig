{ config, lib, pkgs, ... }: 


{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      vim = "nvim";

    };
    plugins = [
      {
        name = "zsh-history-substring-search";
        file = "zsh-history-substring-search.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-history-substring-search";
          rev = "0f80b8eb3368b46e5e573c1d91ae69eb095db3fb";
          sha256 = "0y8va5kc2ram38hbk2cibkk64ffrabfv1sh4xm7pjspsba9n5p1y";
        };
      }
      {
         name = "fzf-tab";
          file = "fzf-tab.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "Aloxaf";
            repo = "fzf-tab";
            rev = "cb8a784343a422ba6d8bdf60acaf4714a6a6d5f7";
            sha256 = "0255whjb3k526q1276z21w6lvalx0b2q6jsd571l69ks1bx7mr9g";
          };
      }
      {
        name = "enhancd";
        file = "init.sh";
        src = pkgs.fetchFromGitHub {
          owner = "b4b4r07";
          repo = "enhancd";
          rev = "ae315ded4dba10685dbbafbfa2ff3c1aefeb490d";
          sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
        };
      }
    ];
    initExtraFirst = ''
      setopt vi
      '';
    initExtra = ''
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
      bindkey -M vicmd 'k' history-substring-search-up
      bindkey -M vicmd 'j' history-substring-search-down
      export PATH=$PATH:$(go env GOPATH)/bin
      '';
  };
  programs.starship = {
    enable = true;
  };
}

