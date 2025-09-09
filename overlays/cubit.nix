self: super: {
  coreform-cubit = super.stdenv.mkDerivation rec {
    pname = "coreform-cubit";
    version = "2025.3+58709";

    src = super.fetchurl {
      url = "https://f002.backblazeb2.com/file/cubit-downloads/Coreform-Cubit/Releases/Linux/Coreform-Cubit-2025.3+58709-Lin64.tar.gz";
      name = "Coreform-Cubit-2025.3+58709-Lin64.tar.gz";
      sha256 = "<à-remplacer-par-le-sha256-correct>";
    };

    nativeBuildInputs = [
      super.gnumake
      super.cmake
      super.gcc
      super.qt5.qtbase
      super.qt5.qtcharts
      super.qt5.qtwidgets
      super.mesa_glu
    ];

    phases = [ "unpackPhase" "installPhase" ];

    unpackPhase = ''
      mkdir -p $out
      tar -xzf $src --strip-components=1 -C $out
    '';

    installPhase = ''
      echo "Coreform Cubit extrait dans $out"
    '';

    meta = with super.lib; {
      description = "Coreform Cubit - Finite Element Software";
      homepage = "https://coreform.com";
      license = licenses.free;
      maintainers = [];
    };
  };
}
