{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      background_color = "0x000000";
      focus_on_activate = true;
    };
  };
}