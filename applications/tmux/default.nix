{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      tmux-fzf
      resurrect
    ];
    sensibleOnTop = true;
    escapeTime = 0;
    terminal = "screen-256color"; 
  };
}
