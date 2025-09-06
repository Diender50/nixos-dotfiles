{ inputs, config, pkgs, lib, ... }:
with lib; {
   imports = [
    ./hypr

    ./hyprpaper.nix
    ./dunst.nix
    ./yazi.nix
    ./rofi
    ./waybar
    ./wlogout
   ];

  home.packages = with pkgs; [
    playerctl
    grim
    swappy
    slurp
    wl-clipboard
    pavucontrol
    udiskie
    qalculate-qt
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };
}

