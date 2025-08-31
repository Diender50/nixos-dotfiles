{ inputs, config, lib, pkgs, ... }:

{
  xdg.configFile."kitty".source = ./config;

  programs.kitty = {
    enable = true;
  };
}
