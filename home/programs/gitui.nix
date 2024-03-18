{...}: {
  programs.gitui = {
    enable = true;
    keyConfig = let
      justChar = char: "( code: Char('${char}'), modifiers: ( bits: 0,),)";
    in ''
      (
        move_left: Some(${justChar "h"}),
        move_down: Some(${justChar "j"}),
        move_up: Some(${justChar "k"}),
        move_right: Some(${justChar "l"}),
      )
    '';
    theme = let
      terminalBg = "Rgb(48, 52, 70)";
    in ''
      (
        push_gauge_fg: Some(${terminalBg}),
        command_fg: Some(${terminalBg}),
        selection_fg: Some(${terminalBg}),
      )
    '';
  };
}
