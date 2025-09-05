{ config, pkgs, ... }:

{
  nix = {
    optimise = {
      automatic = true;
      dates = ["03:45" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
    settings.auto-optimise-store = true;
  };
}