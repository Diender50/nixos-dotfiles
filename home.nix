{ config, pkgs, ... }:

{
  home.username = "Samuel";
  home.homeDirectory = "/home/Samuel";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
    };
  };
  home.stateVersion = "23.05";
}
