{ inputs, config, pkgs, lib, ... }:
with lib; {
   imports = [    
    ./rofi
    ./waybar
    ./wlogout
#    ./hyprland
    ./sway

#    ./yazi.nix
    ];
  home.file.".wallpapers".source = ./wallpapers;

  home.packages = with pkgs; [
    playerctl
    pavucontrol
    udiskie
    qalculate-qt
    kdePackages.dolphin
  ];

}