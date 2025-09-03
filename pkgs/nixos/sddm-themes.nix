{ stdenv, fetchFromGitHub }:
{
  sugar-dark = stdenv.mkDerivation rec {
    pname = "sddm-sugar-dark-theme";
    version = "1.2";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/sugar-dark
    '';
    src = fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-sugar-dark";
      rev = "v${version}";
      sha256 = "0gx0am7vq1ywaw2rm1p015x90b75ccqxnb1sz3wy8yjl27v82yhb";
    };
  };
  
  silent = stdenv.mkDerivation rec {
    pname = "SilentSDDM";
    version = "1.3.5";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/silent
    '';
    src = fetchFromGitHub {
      owner = "uiriansan";
      repo = "SilentSDDM";
      rev = "v${version}";
      sha256 = "sha256-R0rvblJstTgwKxNqJQJaXN9fgksXFjPH5BYVMXdLsbU=";
    };
  };
}
