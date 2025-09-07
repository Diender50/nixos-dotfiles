{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # https://wiki.hyprland.org/Configuring/Keywords/

    "$terminal" = "kitty";
    "$browser" = "zen";
    "$fileManager" = "$terminal -e yazi";
    "$menu" = "rofi -show drun -show-icons";
  };
}
