{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "udiskie"
  #    "hyprpaper"
      "dunst"
      "waybar"
      # Launch common apps
      "vesktop"
    ];
  };
}

