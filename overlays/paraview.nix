self: super: {
  paraview = let
    paraviewTarball = super.fetchurl {
      url = "https://www.paraview.org/files/v6.0/ParaView-6.0.0-MPI-Linux-Python3.12-x86_64.tar.gz";
      sha256 = "TRWDAeG7t1Xwob7D6fen79m5jAXfc9DnUhAGpWO4yGk=";
    };

    # Créer le fichier .desktop séparément
    desktopItem = super.makeDesktopItem {
      name = "paraview";
      desktopName = "ParaView";
      comment = "Scientific Visualization and Analysis Software";
      exec = "paraview %F";
      icon = "paraview";
      categories = [ "Education" "Science" ];
      mimeTypes = [ "application/paraview" ];
    };

  in super.buildFHSEnv {
    name = "paraview";

    targetPkgs = pkgs: with pkgs; [
      stdenv.cc.cc
      zlib
      glib
      xorg.libX11
      xorg.libXext
      xorg.libXt
      xorg.libXrender
      xorg.libXrandr
      xorg.libXcursor
      xorg.libXfixes
      xorg.libXxf86vm
      xorg.libSM
      xorg.libICE
      libGL
      mesa
      dbus
      fontconfig
      freetype
      libxml2
      libxkbcommon
      krb5
      libpciaccess
      qt5.qtbase
      qt5.qtsvg
      qt5.qtx11extras
      qt5.qttools
      mpi

      # Qt xcb plugin deps
      xorg.libxcb
      xorg.xcbutil
      xorg.xcbutilimage
      xorg.xcbutilkeysyms
      xorg.xcbutilrenderutil
      xorg.xcbutilwm
      xorg.xcbutilcursor
    ];

    # Utiliser extraInstallCommands pour créer les fichiers permanents
    extraInstallCommands = ''
      # Extraire et installer l'icône
      mkdir -p temp_extract
      tar -xzf ${paraviewTarball} -C temp_extract --strip-components=1
      
      # Copier l'icône si elle existe
      if [ -f temp_extract/share/icons/hicolor/96x96/apps/paraview.png ]; then
        mkdir -p $out/share/icons/hicolor/96x96/apps
        cp temp_extract/share/icons/hicolor/96x96/apps/paraview.png \
           $out/share/icons/hicolor/96x96/apps/
      fi
      
      # Copier le fichier .desktop
      mkdir -p $out/share/applications
      cp ${desktopItem}/share/applications/paraview.desktop $out/share/applications/
      
      # Nettoyer
      rm -rf temp_extract
    '';

    runScript = ''
      # Préparer ParaView dans un dossier temporaire
      PARAVIEW_DIR=$(mktemp -d)
      tar -xzf ${paraviewTarball} -C $PARAVIEW_DIR --strip-components=1
      
      # Export des variables nécessaires
      export PATH=$PARAVIEW_DIR/bin:$PATH
      export LD_LIBRARY_PATH=$PARAVIEW_DIR/lib:$LD_LIBRARY_PATH
      export QT_PLUGIN_PATH=$PARAVIEW_DIR/lib/Qt/plugins:$QT_PLUGIN_PATH

      # Lancement de ParaView
      exec $PARAVIEW_DIR/bin/paraview "$@"
    '';
  };
}
