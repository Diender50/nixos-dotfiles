{ config, lib, pkgs, username, ... }:
{
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ 
            "wheel" 
            "networkmanager" 
            "audio"
            "video"
            "input"
            ];
        packages = with pkgs; [
            tree
        ];
        shell = pkgs.zsh;
    };
    
    programs.zsh = {
        enable = true;
        histSize = 10000;
        histFile = "$HOME/.zsh_history";
        setOptions = [
            "HIST_IGNORE_DUPS"
            "HIST_IGNORE_ALL_DUPS"
            "HIST_FIND_NO_DUPS"
            "HIST_SAVE_NO_DUPS"
        ];
    };
}