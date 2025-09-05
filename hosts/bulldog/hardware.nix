{ config, lib, pkgs, ... }:
{
    hardware = {
        bluetooth.enable = true;

        cpu.intel.updateMicrocode = true;
    };

    services.libinput.enable = true;

}