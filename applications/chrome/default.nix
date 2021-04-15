{ config, lib, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" #ublock
      "nngceckbapebfimnlniiiahkandclblb" #bitwarden
    ]; 
  };
}
