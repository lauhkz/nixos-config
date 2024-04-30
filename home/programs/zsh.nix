{ pkgs, config, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch = {
        enable = true;
      };
      history = {
        size = 10000;
      };
      shellAliases = {
        ns = "sudo nixos-rebuild switch --flake ~/nixos-config/.#desktop";
        hs = "home-manager switch --impure";
      };
      # Workaround for ZVM overwriting keybinds
      initExtra = ''
      bindkey '^f' autosuggest-accept
      eval "$(fzf --zsh)"
      zvm_after_init_commands+=("bindkey '^[[A' history-substring-search-up")
      zvm_after_init_commands+=("bindkey '^[OA' history-substring-search-up")
      zvm_after_init_commands+=("bindkey '^[[B' history-substring-search-down")
      zvm_after_init_commands+=("bindkey '^[OB' history-substring-search-down")
      '';
      oh-my-zsh = {
        enable = true;
        plugins = ["git"];
        theme = "robbyrussell";
      };
      plugins = [
        {
          name = "zsh-vi-mode";
          src = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
        }
      ];
    };
  };
}
