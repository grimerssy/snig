{ ... }: {
  programs.gitui = {
    enable = true;
    keyConfig =
      let
        key = char: ''Some(( code: Char('${char}'), modifiers: ""))'';
      in
      ''
        (
          move_left: ${key "h"},
          move_down: ${key "j"},
          move_up: ${key "k"},
          move_right: ${key "l"},
        )
      '';
    theme =
      let
        terminalBg = "Some(Rgb(48, 52, 70))";
      in
      ''
        (
          push_gauge_fg: ${terminalBg},
          command_fg: ${terminalBg},
          selection_fg: ${terminalBg},
        )
      '';
  };
}
