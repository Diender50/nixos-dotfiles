{ inputs, config, pkgs, ... }:
 {
  home.file.".wallpapers".source = ./wallpapers;
  
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.wallpapers/totoro_wallpaper.jpg" ];
      wallpaper = [ ",~/.wallpapers/totoro_wallpaper.jpg" ];
    };
  };
 }