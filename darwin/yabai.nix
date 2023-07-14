{ pkgs, ... }: {
  services.yabai = let package = pkgs.yabai;
  in {
    enable = true;
    package = package;
    enableScriptingAddition = true;
    config = {
      mouse_follows_focus = "off";
      focus_follows_mouse = "autoraise";
      layout = "bsp";
      split_ratio = "0.5";
      split_type = "auto";
      auto_balance = "on";
      window_topmost = "on";
      window_placement = "second_child";
      top_padding = "15";
      bottom_padding = "15";
      left_padding = "15";
      right_padding = "15";
      window_gap = "10";
      window_border = "on";
      window_border_blur = "off";
      window_border_width = "2";
      window_border_radius = "10";
      active_window_border_color = "0xFF85C1DC";
      normal_window_border_color = "0x0085C1DC";
      window_shadow = "off";
      window_opacity = "on";
      window_opacity_duration = "0.0";
      active_window_opacity = "1.0";
      normal_window_opacity = "0.9";
      mouse_drop_action = "swap";
      mouse_modifier = "shift";
      mouse_action1 = "move";
      mouse_action2 = "resize";
    };
    extraConfig = let yabai = "${package}/bin/yabai";
    in ''
      ${yabai} -m rule --add app="^Stats$" manage=off
      ${yabai} -m rule --add app="^(Calculator|Software Update|Archive Utility)$" manage=off
      ${yabai} -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
      ${yabai} -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance|FaceTime)$" manage=off
    '';
  };
}
