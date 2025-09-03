{ config, pkgs, username, ...}:

{ 

  home.file.".mozilla/firefox/firefox_theming/chrome".source = ./config;

}
