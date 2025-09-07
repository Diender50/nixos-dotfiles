{ config, pkgs, ... }:

{
  xdg.configFile."sway".source=./config;
  home.packages = with pkgs; [
    swaybg
    swaynotificationcenter
  ];

}
