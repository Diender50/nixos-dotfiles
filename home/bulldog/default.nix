{ config, pkgs, username, nixosPkgs, ... }:
let
  feishinPkg = pkgs.callPackage "${nixosPkgs}/feishin.nix" {};
in
{ 
  imports = [
    ../common
    ./hyprland
    ./kitty
    ./firefox_theming
  ];
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  
  home.packages = with pkgs; [
    firefox
    tree
    # Musique
    feishinPkg
    
    # Communication
    vesktop
    pavucontrol
    thunderbird
   
    # Édition
    vscodium
    kdePackages.kate 

    # fonts
    nerd-fonts.fira-mono

    pfetch
    docker
    python3Full
    pipenv
    paraview
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

