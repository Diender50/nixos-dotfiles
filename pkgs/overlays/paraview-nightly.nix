self: super: {

  paraview-nightly = super.stdenv.mkDerivation rec {
    pname = "paraview";
    version = "6.0.20250903-nightly";

    src = super.fetchurl {
      url = "https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=nightly&type=binary&os=Linux&downloadFile=ParaView-6.0.20250903-MPI-Linux-Python3.12-x86_64.tar.gz";
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; 
      # tu peux mettre "sha256-0000000000000000000000000000000000000000000" pour builder initial, Nix te donnera le vrai hash après l’échec
    };

    unpackCmd = "tar xzf $src --strip-components=1";

    installPhase = ''
      mkdir -p $out
      cp -r * $out/
      wrapProgram $out/bin/paraview \
        --prefix PATH : ${super.python3}/bin
    '';

    meta = with super.lib; {
      description = "ParaView nightly 6.0 (binaire précompilé) avec MEDReader";
      homepage = "https://www.paraview.org";
      license = licenses.bsd3;
      maintainers = [ maintainers.guibert ];
      platforms = platforms.linux;
    };
  };
}
