{ config, pkgs, ... }:

{
#  programs.thefuck.enable = true;  # Supprimé de NixOS 

  programs.zsh = {
    enable = true;
    enableCompletion = true;    
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      dot = "cd ~/.dotfiles";
    };       
 
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"         # also requires `programs.git.enable = true;`
#       "thefuck"     # also requires `programs.thefuck.enable = true;` 
        "fzf"
      ];
      theme = "blinks";
    };    
  };
}


