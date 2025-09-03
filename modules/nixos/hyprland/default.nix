{ config, pkgs, ... }:

{
  services.udisks2.enable = true;

  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true; # optionnel mais pratique pour gérer les clés

  services.xserver = {
    enable = true;
    xkb = {
      layout = "fr";
      variant = "azerty";
    };
  };
  
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  security.pam.services.hyprland.enableGnomeKeyring = true;
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
}
