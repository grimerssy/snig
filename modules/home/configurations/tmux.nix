{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    historyLimit = 50000;
    focusEvents = true;
    aggressiveResize = true;
    shell = "${pkgs.fish}/bin/fish";
    baseIndex = 1;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    shortcut = "a";
    terminal = "tmux-256color";
    # TODO revisit nix options
    extraConfig = ''
      set -ogq @snig_session "#{session_name}"

      set -g renumber-windows on
      set -g detach-on-destroy off
      set -g terminal-overrides ",*:RGB"

      set -g status-style 'bg=default'
      set -g status-position top
      set -g status-justify left
      set -g status-left-length 100
      set -g status-right-length 100

      set -g status-left ""
      set -g status-right "#{E:@snig_session}"

      unbind %
      unbind '"'
      bind \\ split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      bind -r ^ last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R
      bind C-h resize-pane -L 5
      bind C-j resize-pane -D 5
      bind C-k resize-pane -U 5
      bind C-l resize-pane -R 5

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection

      bind r source-file ~/.config/tmux/tmux.conf

      bind C-s display-popup -E "tmux-session"

      bind-key . run-shell 'open -R "$(tmux display-message -p "#{pane_current_path}")"'
    '';
  };
}
