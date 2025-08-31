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
    bat
    btop
    curl
    fastfetch
    fzf
    wget
  ];
}
