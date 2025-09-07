{ inputs, config, lib, pkgs, ... }:
{
  imports = [
    ./animations.nix
    ./decoration.nix
    ./general.nix
    ./misc.nix
  ];
}