{ config, pkgs, ... }:

{
  programs.fzf.enableZshIntegration = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;    
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = "pfetch";

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      dot = "cd ~/.dotfiles";
    };      

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"   
        "fzf"
      ];
      theme = "blinks";
    };    
  };
}


