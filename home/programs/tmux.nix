{ pkgs, config, ... }:

{
  programs = {
    tmux = {
     enable = true;
     baseIndex = 1;
     clock24 = true;
     escapeTime = 0;
     keyMode = "vi";
     newSession = true;
     prefix = "C-a";
     terminal = "screen-256color";
     extraConfig = ''
       set -g status-style "fg=#665c54"
       set -g status-left-style "fg=#928374"

       set -g status-bg default
       set -g status-position top
       set -g status-interval 1
       set -g status-left ""

       bind -T copy-mode-vi v send-keys -X begin-selection
       bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

       bind -r D neww -c "#{pane_current_path}" "[[ -e TODO.md ]] && nvim TODO.md || nvim ~/.dotfiles/personal/todo.md"

       # forget the find window.  That is for chumps
       bind-key -r f run-shell "tmux neww ~/.local/bin/tmux-sessionizer"

       bind-key -r i run-shell "tmux neww tmux-cht.sh"
     '';
    };
  };
}
