{ config, pkgs, username, nixosPkgs, codedisaster,... }:
let
  feishinPkg = pkgs.callPackage "${nixosPkgs}/nixos/feishin.nix" {};
in
{ 

  imports = [
    ../common
    ./hyprland
    ./kitty
    ./firefox_theming
    ./paraview

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

    paraview
   
    codedisaster.packages.x86_64-linux.default
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

