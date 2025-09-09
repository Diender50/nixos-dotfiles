{ config, pkgs, ... }:

{
  xdg.configFile."sway".source=./config;
  
  home.packages = with pkgs; [
    swaybg
    swaynotificationcenter
    grim
    slurp
    wl-clipboard
    swappy
  ];
}
