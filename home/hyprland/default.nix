{ config, pkgs, ... }: {
  imports = [
    ./waybar.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      monitor = "eDP-1,2560x1440@165,0x0,1";

      general = {
        gaps_in = 2;
        gaps_out = 6;
        border_size = 2;
        "col.active_border" = "rgba(ffffffff)";
        "col.inactive_border" = "rgba(777777ff)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 12;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur.enabled = false;
        shadow = {
          enabled = false;
        };
      };

      animations = {
        enabled = true;
        bezier = "snappy, 0.23, 1, 0.32, 1";
        animation = [
          "windows, 1, 4, snappy, slide"
          "border, 1, 6, snappy"
          "workspaces, 1, 4, snappy, slidevert"
          "fade, 1, 4, snappy"
        ];
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      "$mod" = "SUPER";

      bind = [
        "$mod, D, exec, wofi --show drun"
        "$mod, Return, exec, kitty"
        "$mod, T, exec, kitty"
        "$mod, E, exec, nautilus"
        "$mod, Q, killactive"
        "$mod, slash, exec, rofi -show drun"
        "$mod, Tab, exec, rofi -show window"
        "$mod, F, fullscreen, 0"
        "$mod SHIFT, F, fullscreen, 1"
        "$mod CTRL, F, togglefloating"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        "$mod, R, submap, resize"
        "$mod, N, submap, nix"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "float, class:^(pavucontrol)$"
        "float, class:^(nm-connection-editor)$"
        "rounding 16, class:^(kitty)$"
      ];

      exec-once = [
        "waybar"
        "mako"
        "swww-daemon"
        "wl-paste --watch cliphist store"
	"sleep 1 && swww img ~/Downloads/cave.jpg"
      ];
    };

    extraConfig = ''
      submap = resize
      binde = , right, resizeactive, 20 0
      binde = , left, resizeactive, -20 0
      binde = , up, resizeactive, 0 -20
      binde = , down, resizeactive, 0 20
      bind = , escape, submap, reset
      submap = reset

      submap = nix
      bind = , R, exec, kitty -e sudo nixos-rebuild switch --flake ~/flake#victus
      bind = , R, submap, reset
      bind = , U, exec, kitty -e nix flake update ~/flake
      bind = , U, submap, reset
      bind = , G, exec, kitty -e nix-collect-garbage -d
      bind = , G, submap, reset
      bind = , C, exec, kitty -e nix flake check ~/flake
      bind = , C, submap, reset
      bind = , escape, submap, reset
      submap = reset
    '';
  };
}
