{
  programs.zsh = {
    enable = true;
    
    enableCompletion = true;
    autocd = true;

    history.size = 10000;
    history.path = "$HOME/.cache/zsh_history";
    
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zdharma-continuum/fast-syntax-highlighting"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };

    initExtra = "
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh # apply p10k theme
    ";
  };
  
  home.file.".p10k.zsh".source = ./p10k.zsh;
}

