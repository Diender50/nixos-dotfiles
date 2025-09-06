inputs: [
  (final: prev: {
    zen = inputs.zen-browser.packages.${prev.system}.zen-browser;
    codedisaster = inputs.codedisaster.packages.${prev.system}.default;
    nix-gaming = inputs.nix-gaming.packages.${prev.system};
  })
  
  (import ./paraview.nix)
]
