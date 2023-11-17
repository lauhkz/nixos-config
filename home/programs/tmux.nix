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
     set -g status-style 'bg=#333333 fg=#5eacd3'

     bind -T copy-mode-vi v send-keys -X begin-selection
     bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
     '';
    };
  };
}
