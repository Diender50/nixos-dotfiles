{ config, pkgs, username, ... }:

{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
    };
  };
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
