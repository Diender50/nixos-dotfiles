self: super: {

  salome-meca-wrapper = super.stdenv.mkDerivation {
    pname = "salome-meca-wrapper";
    version = "1.0-1-20240327";

    src = super.fetchurl {
      url = "https://code-aster.org/FICHIERS/singularity/salome_meca-lgpl-2024.1.0-1-20240327-scibian-11.sif";
      sha256 = "FSYHNIk1xD5UyL0bzgqw564XBbFS5mn4i7xtRHCqiXc=";
    };
    
    iconSrc = super.fetchurl {
      url = "https://code-aster.org/IMG/logo/siteon0.png";  # mettez ici l’URL réelle de l’icône
      sha256 = "DXb73EeWl73sdLr8Zz7wFWeH9VyvEqXMY7LwvJyYj08=";
    };

    dontUnpack = true;

    buildInputs = [ super.python3 super.singularity ];

    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/salome_meca.sif

      mkdir -p $out/share/icons/hicolor/256x256/apps
      cp $iconSrc $out/share/icons/hicolor/256x256/apps/salome-meca.png

      cat > $out/bin/salome-meca <<EOF
#!/bin/sh
exec singularity run $out/salome_meca.sif "\$@"
EOF
      chmod +x $out/bin/salome-meca

      mkdir -p $out/share/applications
      cat > $out/share/applications/salome-meca.desktop <<EOF
[Desktop Entry]
Name=Salome-Meca
Comment=Launch Salome-Meca via Singularity
Exec=$out/bin/salome-meca
Icon=salome-meca
Terminal=false
Type=Application
Categories=Science;Engineering;
EOF
    '';

    meta = with super.lib; {
      description = "Wrapper to launch Salome-Meca script with python3 environment";
      license = licenses.mit;
      platforms = [ "x86_64-linux" ];
    };
  };
}
