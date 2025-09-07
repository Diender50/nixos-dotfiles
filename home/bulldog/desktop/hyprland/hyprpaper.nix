{ inputs, config, pkgs, ... }:
 {  
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.wallpapers/totoro_wallpaper.jpg" ];
      wallpaper = [ ",~/.wallpapers/totoro_wallpaper.jpg" ];
    };
  };
 }