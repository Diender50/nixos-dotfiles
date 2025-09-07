{ inputs, config, pkgs, lib, ... }:
with lib; {
   imports = [
    ./hypr

    ./hyprpaper.nix
    ./dunst.nix
   ];


  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };
}

