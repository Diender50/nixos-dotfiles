{ config, pkgs, nixosPkgs, ... }: 
let 
  sddm_themes = pkgs.callPackage "${nixosPkgs}/sddm-themes.nix" {};
in
{
  environment.systemPackages = with pkgs; 
    [ 
      sddm_themes.silent 
      kdePackages.kscreen
    ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    settings.General.DisplayServer = "wayland";
    theme = "silent";
#    wayland.compositor = "kwin";
  };

}
