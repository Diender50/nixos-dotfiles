{ lib, config, pkgs, ... }:

let
  ldconfig = pkgs.writeScript "ldconfig" ''
    #! /usr/bin/env bash
    cleanup() {
      rm -f "$TMP"
    }
    trap cleanup EXIT
    TMP=$(mktemp)
    ldconfig -C "$TMP" /run/opengl-driver/lib
    ldconfig -C "$TMP" $@
  '';

  inherit (pkg) projectName;

  cfg = config.programs.singularity;
  pkg = pkgs.singularity;
  pkgOpenglDriver = pkg.overrideAttrs (a: {
    postInstall = (a.postInstall or "") + ''
      sed -i 's|.*ldconfig path =.*|ldconfig path = ${ldconfig}|' $out/etc/${projectName}/${projectName}.conf
    '';
  });

in
{
  programs.singularity.enable = true;
  programs.singularity.package = pkgOpenglDriver;
  programs.singularity.enableSuid = true;
}