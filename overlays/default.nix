inputs: [
  (final: prev: {
    zen = inputs.zen-browser.packages.${prev.system}.zen-browser;
    codedisaster = inputs.codedisaster.packages.${prev.system}.default;
    nix-gaming = inputs.nix-gaming.packages.${prev.system};
  })
  
  (import ./paraview.nix)
  (import ./salome-meca.nix)
  (import ./cubit.nix)
#  (import ./wayfire.nix)
#  (import ./wayfire-plugins/pixdecor.nix)
]
