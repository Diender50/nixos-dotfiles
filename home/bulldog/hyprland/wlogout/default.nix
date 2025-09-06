{ inputs, config, pkgs, ... }:
{
  xdg.configFile."wlogout".source = ./conf;

    programs.wlogout = {
        enable = true;
    };
}