{ pkgs, ... }: {
  services.yabai =
    let
      package = pkgs.yabai;
      yabai = "${package}/bin/yabai";
    in
    {
      inherit package;
      enable = true;
      enableScriptingAddition = true;
      config = {
        mouse_follows_focus = "on";
        focus_follows_mouse = "autoraise";
        layout = "bsp";
        split_ratio = "0.5";
        split_type = "auto";
        auto_balance = "off";
        window_zoom_persist = "on";
        window_topmost = "on";
        window_placement = "second_child";
        top_padding = "15";
        bottom_padding = "15";
        left_padding = "15";
        right_padding = "15";
        window_gap = "10";
        window_shadow = "off";
        window_opacity = "on";
        window_opacity_duration = "0.0";
        active_window_opacity = "1.0";
        normal_window_opacity = "0.8";
        mouse_drop_action = "swap";
        mouse_modifier = "shift";
        mouse_action1 = "move";
        mouse_action2 = "resize";
      };
      extraConfig = ''
        ${yabai} -m signal --add event=space_changed action="~/.nix-profile/bin/destroy-empty-spaces"
        ${yabai} -m signal --add event=window_destroyed action="yabai -m window --focus mouse"
        ${yabai} -m rule --add app="^Pika$" manage=off
        ${yabai} -m rule --add app="^Stats$" manage=off
        ${yabai} -m rule --add app="^Calculator$" manage=off
        ${yabai} -m rule --add app="^System Settings$" manage=off
        ${yabai} -m rule --add app="^Archive Utility$" manage=off
        ${yabai} -m rule --add app="^Software Update$" manage=off
        ${yabai} -m rule --add label="Finder" app="^Finder$" title="(Copy|Connect|Move|Info|Pref)" manage=off
      '';
    };
}
