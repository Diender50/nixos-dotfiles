{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # https://wiki.hyprland.org/Configuring/Variables/#input
    input = {
      kb_layout = "fr";
      # kb_variant = "";
      # kb_model = "";
      # kb_options = "";
      # kb_rules = "";
      numlock_by_default = true;

      follow_mouse = 1;

      touchpad = {
        natural_scroll = true;
      };
    };

    # https://wiki.hyprland.org/Configuring/Variables/#gestures
    gestures = {
      workspace_swipe = true;
      workspace_swipe_distance = 90;
      workspace_swipe_create_new = false;
    };

    # https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs
    device = {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    };
  };
}