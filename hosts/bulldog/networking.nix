{ config, lib, pkgs, hostname, ... }:
{
    networking = {
        hostName = "${hostname}";
        networkmanager.enable = true;
        firewall.enable = true;
    };
}