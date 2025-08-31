{ config, pkgs, ... }:
{
  # Ici tu peux lier directement ~/.config/hypr/ depuis ton repo
  xdg.configFile."hypr".source = ./config/hypr;
  xdg.configFile."rofi".source = ./config/rofi;
  xdg.configFile."waybar".source = ./config/waybar;
  xdg.configFile."wlogout".source = ./config/wlogout;
  xdg.configFile."qt6ct".source = ./config/qt6ct; 
  xdg.configFile."kdeglobals".source = ./config/qt6ct/kdeglobals;   

  # Paquets user liés à Hyprland
  home.packages = with pkgs; [
    rofi-wayland
    networkmanagerapplet
    waybar
    kdePackages.dolphin
    wlogout
    hyprpaper
    kdePackages.qt6ct
  ];
}

