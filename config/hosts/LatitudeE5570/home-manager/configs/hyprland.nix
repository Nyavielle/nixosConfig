{
  home.file.".config/hypr/hyprland.conf".text = ''
    monitor = , preferred, auto, 1

    env = XCURSOR_SIZE, 24
    env = HYPRCURSOR_SIZE, 24

    general {
      gaps_in = 5
      gaps_out = 10

      border_size = 2

      col.active_border = rgba(0,255,0,1)
      col.inactive_border = rgba(0,100,0,1)

      resize_on_border = false

      no_focus_fallback = true

      no_border_on_floating = true

      allow_tearing = true

      layout = dwindle
    }

    decoration {
      rounding = 0

      active_opacity = 1.0
      inactive_opacity = 1.0

      shadow {
        enabled = false
      }

      blur {
        enabled = false
      }
    }

    animations {
      enabled = false
    }

    workspace = w[tv1], gapsout:0, gapsin:0
    workspace = f[1], gapsout:0, gapsin:0
    windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
    windowrule = rounding 0, floating:0, onworkspace:w[tv1]
    windowrule = bordersize 0, floating:0, onworkspace:f[1]
    windowrule = rounding 0, floating:0, onworkspace:f[1]
    
    windowrulev2 = float, class:firefox, title:Picture-in-Picture
    windowrulev2 = pin,class:^(firefox)$,title:^(Picture-in-Picture)$
    windowrulev2 = size 27% 27%, class:firefox, title:Picture-in-Picture
    windowrulev2 = move 73% 73%, class:firefox, title:Picture-in-Picture


    dwindle {
      preserve_split = true
    }

    misc {
      disable_hyprland_logo = true;
      background_color = rgba(0,0,0,0)
    }

    input {
      kb_layout = us,ua
      kb_options = grp:caps_toggle
      follow_mouse = 1
      sensitivity = -0.80
    }

    bind = super, return, exec, alacritty
    bind = super, space, exec, wofi --show drun

    bind = super, q, killactive,
    bind = super shift, q, exit,
    bind = super, f, togglefloating,
    bind = super, r, togglesplit,
    bind = super, p, pin,

    bind = super, h, movefocus, l
    bind = super, j, movefocus, d
    bind = super, k, movefocus, u
    bind = super, l, movefocus, r
    
    bind = super shift, h, movewindow, l
    bind = super shift, j, movewindow, d
    bind = super shift, k, movewindow, u
    bind = super shift, l, movewindow, r

    bind = super, 1, workspace, 1
    bind = super, 2, workspace, 2
    bind = super, 3, workspace, 3
    bind = super, 4, workspace, 4
    bind = super, 5, workspace, 5
    bind = super, 6, workspace, 6
    bind = super, 7, workspace, 7
    bind = super, 8, workspace, 8
    bind = super, 9, workspace, 9
    bind = super, 0, workspace, 10

    bind = super shift, 1, movetoworkspace, 1
    bind = super shift, 2, movetoworkspace, 2
    bind = super shift, 3, movetoworkspace, 3
    bind = super shift, 4, movetoworkspace, 4
    bind = super shift, 5, movetoworkspace, 5
    bind = super shift, 6, movetoworkspace, 6
    bind = super shift, 7, movetoworkspace, 7
    bind = super shift, 8, movetoworkspace, 8
    bind = super shift, 9, movetoworkspace, 9
    bind = super shift, 0, movetoworkspace, 10

    bind = super, mouse_down, workspace, e+1
    bind = super, mouse_up, workspace, e-1
    
    bindm = super, mouse:272, movewindow
    bindm = super, mouse:273, resizewindow

    bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
    bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
    bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

    bindl = , XF86AudioNext, exec, playerctl next
    bindl = , XF86AudioPause, exec, playerctl play-pause
    bindl = , XF86AudioPlay, exec, playerctl play-pause
    bindl = , XF86AudioPrev, exec, playerctl previous

    bind = , print, exec, grim ~/Pictures/screenshots/screenshot_$(date '+%d.%m.%Y_%H:%M:%S').png
    bind = super, print, exec, grim -g "$(slurp)" ~/Pictures/screenshots/screenshot_$(date '+%d.%m.%Y_%H:%M:%S').png
  '';
}
