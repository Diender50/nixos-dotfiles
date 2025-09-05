{ config, lib, pkgs, hostname, username, nixosModules, ... }:

{
  imports =
    [ 
      # Configurations système
      ./hardware-configuration.nix
      ./boot.nix
      ./networking.nix
      ./nvidia.nix
      ./audio.nix
      ./hardware.nix
      ./users.nix

      "${nixosModules}/system/storage.nix"

      # Applications
      "${nixosModules}/desktop/sddm.nix"
      "${nixosModules}/desktop/hyprland.nix"
      "${nixosModules}/games/steam.nix"
      "${nixosModules}/games/lutris.nix"
   ];
  
#  nixpkgs.overlays = [ paraview-overlay ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.variables.EDITOR = "nano";
 
  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";
 
  console.keyMap = "fr";

  environment.systemPackages = with pkgs; [
    git
    vim
    neovim
    wget
    htop
    fastfetch
  ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; # PAS TOUCHEROW

}

