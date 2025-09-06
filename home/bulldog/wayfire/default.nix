{ config, pkgs, ... }:

{
    xdg.configFile."wayfire.ini".source=./wayfire.ini;

    home.packages = with pkgs; [
        kanshi
        wlr-randr
    ];
}