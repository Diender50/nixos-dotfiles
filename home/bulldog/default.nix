{ config, pkgs, username, inputs,... }:

{ 
  imports = [
    ../common
    ./hyprland
    ./kitty
    ./vscodium
  ];
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    # Navigateur
    zen

    # Musique
    supersonic-wayland
   
    # Communication
    vesktop
    thunderbird
   
    # Mécanique
    paraview
    codedisaster
    freecad
  ];
  
  programs.zsh.sessionVariables = {
    TERMINAL = "kitty";
  };

  home.sessionVariables = { 
    TERMINAL = "kitty"; 
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}

