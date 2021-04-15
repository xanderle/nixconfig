{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "xanderle";
  home.homeDirectory = "/home/xanderle";
  nixpkgs.config.allowUnfree = true;
 imports = [ 
    ./applications/alacritty
    ./applications/zsh 
    ./applications/neovim 
    ./applications/git
    ./applications/fzf
    ./applications/direnv
    ./applications/awesome
    ./applications/tmux ];
  home.packages = with pkgs; [
    jq
    chromium
    nodePackages.node2nix
    unzip
    slack
      asciinema
      go
      taskwarrior
      silver-searcher
      ripgrep
      kubectl
      openssl
      openssl.dev
      kubernetes-helm
 	  atool 
	  httpie
	  weechat
	  exa
	  bat
	  lazygit
	  lazydocker
      nodejs-10_x
	  yarn
      docker
    ];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
