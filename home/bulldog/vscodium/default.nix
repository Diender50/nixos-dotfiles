{ config, pkgs, ... }:
{
  # Ici tu peux lier directement ~/.config/hypr/ depuis ton repo
  home.file.".vscode-oss/extensions/code-aster-vscode".source = ./extension-aster;
  xdg.configFile."VSCodium/product.json".source = ./enable_marketplace.json;

  home.packages = with pkgs; [
    vscodium-fhs
    vsce
    nodejs_24
  ];
}
