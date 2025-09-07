{ inputs, config, pkgs, ... }:
{
  xdg.configFile."wlogout".source = ./conf_sway;

    programs.wlogout = {
        enable = true;
    };
    home.packages = with pkgs; [
      swaylock-fancy
  ];
}