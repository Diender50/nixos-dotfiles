{ config, pkgs, ... }:
{
  # Ici tu peux lier directement ~/.config/hypr/ depuis ton repo
  xdg.configFile."hypr".source = ./config/hypr;
  xdg.configFile."rofi".source = ./config/rofi;
  xdg.configFile."waybar".source = ./config/waybar;

  # Paquets user liés à Hyprland
  home.packages = with pkgs; [
    rofi-wayland
    networkmanagerapplet
    waybar
  ];
}

