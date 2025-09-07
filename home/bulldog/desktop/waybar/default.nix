{ inputs, config, pkgs, ... }:
{
    xdg.configFile."waybar".source = ./conf;

    programs.waybar = {
        enable = true;
    };
}