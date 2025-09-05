inputs: [
  (final: prev: {
    zen = inputs.zen-browser.packages.${prev.system}.zen-browser;
    codedisaster = inputs.codedisaster.packages.${prev.system}.default;
  })
  
  (import ./paraview.nix)
]
