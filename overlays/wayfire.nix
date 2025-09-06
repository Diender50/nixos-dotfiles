self: super: {
  wayfire = super.wayfire.overrideAttrs (oldAttrs: {
    version = "0.10.0";
    src = super.fetchFromGitHub {
      owner = "WayfireWM";
      repo = "wayfire";
      rev = "refs/tags/0.10.0";
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # À obtenir
    };
  });
}