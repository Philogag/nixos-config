{
  programs.zsh = {
    enable = true;
    
    enableCompletion = true;
    autocd = true;

    history.size = 10000;
    history.path = "$HOME/.cache/zsh_history";
  };
  
  home.file.".zshrc".source = ./zshrc;
  home.file.".p10k.zsh".source = ./p10k.zsh;
}

