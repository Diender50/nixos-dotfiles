{ config, lib, pkgs, ... }:
{
    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };

    hardware.pulseaudio.enable = false;

    security.rtkit.enable = true;
}