{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      import = ["/home/xanderle/.config/alacritty/altfix.yml"];
      env = {
        WINIT_X11_SCALE_FACTOR="1";
      };
      background_opacity = 0.8;
      window = {
        decorations = "full";
        padding = {
          x = 10;
          y = 10;
        };
      };
      font = {
        normal= {
          family= "Hack Nerd Font Mono";
        };
      };

    };
  };
  xdg.configFile."alacritty/altfix.yml".source = ./altfix.yml;

}
