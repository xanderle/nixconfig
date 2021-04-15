{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "alex@xanderle.xyz";
    userName = "xanderle";
  };
}
