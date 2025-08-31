{ config, pkgs, username, ... }:

{ 
  imports = [
    ../common
    ./hyprland
    ./kitty
  ];
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  
  home.packages = with pkgs; [
    firefox
    tree
    
    # Communication
    vesktop
    pavucontrol
 
    # Édition
    vscodium
    kdePackages.kate 

    # fonts
    nerd-fonts.fira-mono
  ];
  
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
    };
  };
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}

