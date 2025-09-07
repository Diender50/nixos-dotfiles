{ inputs, config, pkgs, ... }:
{
    xdg.configFile."rofi/theme.rasi".source=./theme.rasi;

    programs.rofi = {
        enable = true;
        theme = "~/.config/rofi/theme.rasi";
    };
}