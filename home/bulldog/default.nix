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
    # Musique
    feishin
    
    # Communication
    vesktop
    pavucontrol
    thunderbird
   
    # Édition
    vscodium
    kdePackages.kate 

    # fonts
    nerd-fonts.fira-mono
    
    # Calc
    singularity
  
    pfetch
  ];
  
  programs.zsh = {
    enable = true;
    initContent = "pfetch";
    shellAliases = {
      btw = "echo i use nixos btw";
    };
    sessionVariables = {
      TERMINAL = "kitty";
    };
  };
  home.sessionVariables = { TERMINAL = "kitty"; };
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}

