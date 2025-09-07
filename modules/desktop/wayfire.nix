{ config, pkgs, ... }:

{    
    programs.wayfire = {
        enable = true;
        plugins = with pkgs.wayfirePlugins; [
            wcm
            wayfire-plugins-extra
        ];
        xwayland.enable = true;
    };

}