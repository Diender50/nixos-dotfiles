{ config, pkgs, ... }:

{
  imports = [
    ./shell
  ];

  programs.fzf.enableZshIntegration = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Archives
    zip
    unzip

    # Utils
    bat
    btop
    curl
    fastfetch
    fzf
    wget

    # Edition
    onlyoffice-bin
    
    # cloud
    nextcloud-client
   ];
}
