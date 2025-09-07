{ inputs, config, lib, pkgs, ... }:
{
  imports = [
    ./variables

    ./monitors.nix
    ./programs.nix
    ./autostart.nix
    ./cursor.nix
    ./input.nix
    ./keybindings.nix
#    ./workspace_rules.nix
    ./window_rules.nix
    ./master_layout.nix
    ./dwindle_layout.nix
  ];
}
