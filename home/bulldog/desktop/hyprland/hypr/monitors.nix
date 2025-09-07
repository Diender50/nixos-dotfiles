{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # See https://wiki.hyprland.org/Configuring/Monitors/
    monitor = [
      "desc:Lenovo Group Limited R24e UPAC5247, 1920x1080@180, 0x0, 1"
      "desc:AU Optronics 0x9F91, 3072x1920@60, 1920x0, 2"
      "desc:Dell Inc. DELL P2425H 8NVWX34, 1920x1080@100, -1920x0, 1"

      ",preferred,auto,auto"
    ];
  };
}