{ config, pkgs, lib,... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    nvidia = {
      modesetting.enable = true;
      open = true; # à ajuster selon ton matériel
      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };

  specialisation = {
    on-the-go.configuration = {
      system.nixos.tags = [ "on-the-go" ];
      services.xserver.videoDrivers = [ "modesetting" "nvidia" ]; # optionnel, peux rester comme [ "nvidia" ]
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce true;
        prime.offload.enableOffloadCmd = lib.mkForce true;
        prime.sync.enable = lib.mkForce false;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
    egl-wayland
  ];
}
