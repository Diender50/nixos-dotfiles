{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      # https://wiki.hyprland.org/Configuring/Environment-variables/
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];
  };
}