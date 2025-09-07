{ inputs, config, pkgs, lib, ... }:
with lib; {
   imports = [    
    ./rofi
    ./waybar
    ./wlogout
#    ./hyprland
    ./sway

    ./yazi.nix
    ];
  home.file.".wallpapers".source = ./wallpapers;

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

}