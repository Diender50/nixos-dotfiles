{ config, pkgs, ... }:

{
  imports = [
    ./shell
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Archives
    zip
    unzip

    # Utils
    tree
    bat
    btop
    curl
    fastfetch
    pfetch
    fzf
    wget
    ncdu

    # Edition
    onlyoffice-bin
    libreoffice
    
    # cloud
    nextcloud-client
   
    # font
    fira-sans
    nerd-fonts.fira-mono
   ];
}
