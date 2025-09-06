{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # See https://wiki.hyprland.org/Configuring/Keywords/
    "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

    bind = [
      "$mainMod, Q, exec, $terminal"
      "$mainMod, C, killactive"
      "$mainMod, M, exit"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod, R, exec, $menu"
      "$mainMod, P, pin"
      "$mainMod CONTROL, L, exec, hyprlock &"
      "$mainMod, P, pseudo"
      "$mainMod, J, togglesplit"
      "$mainMod, F, exec, $browser"
      "$mainMod ALT, F, fullscreen"

      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, ampersand, workspace, 1"
      "$mainMod, eacute, workspace, 2"
      "$mainMod, quotedbl, workspace, 3"
      "$mainMod, apostrophe, workspace, 4"
      "$mainMod, parenleft, workspace, 5"
      "$mainMod, minus, workspace, 6"
      "$mainMod, egrave, workspace, 7"
      "$mainMod, underscore, workspace, 8"
      "$mainMod, ccedilla, workspace, 9"
      "$mainMod, agrave, workspace, 10"

      "$mainMod CONTROL, left, workspace, e-1"
      "$mainMod CONTROL, right, workspace, e+1"

      "$mainMod, TAB, workspace, previous"

      "$mainMod SHIFT, S, exec, sh -c \"grim -g \\\"\$(slurp)\\\" - | tee >(wl-copy) | swappy -f -\""

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, ampersand, movetoworkspace, 1"
      "$mainMod SHIFT, eacute, movetoworkspace, 2"
      "$mainMod SHIFT, quotedbl, movetoworkspace, 3"
      "$mainMod SHIFT, apostrophe, movetoworkspace, 4"
      "$mainMod SHIFT, parenleft, movetoworkspace, 5"
      "$mainMod SHIFT, minus, movetoworkspace, 6"
      "$mainMod SHIFT, egrave, movetoworkspace, 7"
      "$mainMod SHIFT, underscore, movetoworkspace, 8"
      "$mainMod SHIFT, ccedilla, movetoworkspace, 9"
      "$mainMod SHIFT, agrave, movetoworkspace, 10"

      "$mainMod CONTROLSHIFT, left, movetoworkspace, e-1"
      "$mainMod CONTROLSHIFT, right, movetoworkspace, e+1"

      # Move current workspace to next/previous monitor
      "$mainMod ALT, left, movecurrentworkspacetomonitor, -1"
      "$mainMod ALT, right, movecurrentworkspacetomonitor, +1"

      # Example special workspace (scratchpad)
      # "$mainMod, S, togglespecialworkspace, magic"
      # "$mainMod SHIFT, S, movetoworkspace, special:magic"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      # Laptop multimedia keys for volume and LCD brightness
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];

    bindl = [
      # Requires playerctl
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"

      # Lid closed/opened detection
      ", switch:on:Lid Switch, exec, hyprctl keyword monitor 'eDP-1, disable'"
      ", switch:off:Lid Switch, exec, hyprctl keyword monitor 'eDP-1, 1920x1080@60, 0x0, 1'"
    ];
  };
}
