{ config, pkgs, nixosPkgs, ... }:

let
  paraviewIcon = pkgs.runCommand "paraview-icon" {} ''
    mkdir -p $out/share/icons/hicolor/256x256/apps
    cp ${./paraview.png} $out/share/icons/hicolor/256x256/apps/paraview.png
  '';
in
{
  nixpkgs.overlays = [
    (import "${nixosPkgs}/overlays/paraview.nix")
  ];

  xdg.desktopEntries.paraview = {
    name = "ParaView";
    exec = "paraview";
    icon = "${paraviewIcon}/share/icons/hicolor/256x256/apps/paraview.png";
    terminal = false;
    categories = [ "Science" ];
  };
}
