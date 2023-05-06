{ pkgs, ... }: {
  services.skhd = let package = pkgs.skhd;
  in {
    enable = true;
    package = package;
    skhdConfig = let
      skhd = "${package}/bin/skhd";
      yabai = "${pkgs.yabai}/bin/yabai";
    in ''
      rctrl - space : ${skhd} --key escape

      rctrl - h : ${skhd} --key left
      rctrl - j : ${skhd} --key down
      rctrl - k : ${skhd} --key up
      rctrl - l : ${skhd} --key right

      rctrl - return : open -n $HOME/Applications/Home\ Manager\ Apps/Alacritty.app

      rctrl - e : ${yabai} -m space --balance

      rctrl - r : ${yabai} -m space --rotate 270

      rctrl - b : ${yabai} -m window --toggle border

      rctrl - f : ${yabai} -m window --toggle zoom-fullscreen
      shift + cmd - return : ${yabai} -m window --toggle native-fullscreen

      rctrl - g : ${yabai} -m space --toggle padding; \
                  ${yabai} -m space --toggle gap

      rctrl - c : ${yabai} -m window --toggle float; \
                  ${yabai} -m window --grid 4:4:1:1:2:2

      cmd + shift - h : ${yabai} -m window --focus west
      cmd + shift - j : ${yabai} -m window --focus south
      cmd + shift - k : ${yabai} -m window --focus north
      cmd + shift - l : ${yabai} -m window --focus east

      cmd + rctrl - h : ${yabai} -m window --swap west
      cmd + rctrl - j : ${yabai} -m window --swap south
      cmd + rctrl - k : ${yabai} -m window --swap north
      cmd + rctrl - l : ${yabai} -m window --swap east

      cmd - 1 : ${yabai} -m space --focus 1
      cmd - 2 : ${yabai} -m space --focus 2
      cmd - 3 : ${yabai} -m space --focus 3
      cmd - 4 : ${yabai} -m space --focus 4
      cmd - 5 : ${yabai} -m space --focus 5
      cmd - 6 : ${yabai} -m space --focus 6
      cmd - 7 : ${yabai} -m space --focus 7
      cmd - 8 : ${yabai} -m space --focus 8
      cmd - 9 : ${yabai} -m space --focus 9
      cmd - 0 : ${yabai} -m space --focus 10
      cmd + rctrl - r : ${yabai} -m space --focus recent
      cmd + lctrl - h : ${yabai} -m space --focus prev
      cmd + lctrl - l : ${yabai} -m space --focus next

      rctrl - 1 : ${yabai} -m window --space 1
      rctrl - 2 : ${yabai} -m window --space 2
      rctrl - 3 : ${yabai} -m window --space 3
      rctrl - 4 : ${yabai} -m window --space 4
      rctrl - 5 : ${yabai} -m window --space 5
      rctrl - 6 : ${yabai} -m window --space 6
      rctrl - 7 : ${yabai} -m window --space 7
      rctrl - 8 : ${yabai} -m window --space 8
      rctrl - 9 : ${yabai} -m window --space 9
      rctrl - 0 : ${yabai} -m window --space 10
      shift + rctrl - r : ${yabai} -m window --space recent
      shift + cmd + lctrl - h : ${yabai} -m window --space prev
      shift + cmd + lctrl - l : ${yabai} -m window --space next
    '';
  };
}
