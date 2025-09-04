self: super: {

  paraview = let
    paraviewTarball = super.fetchurl {
      url = "https://www.paraview.org/files/v6.0/ParaView-6.0.0-MPI-Linux-Python3.12-x86_64.tar.gz";
      sha256 = "TRWDAeG7t1Xwob7D6fen79m5jAXfc9DnUhAGpWO4yGk=";
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

    runScript = ''
      # Préparation du dossier ParaView dans le FHS env
      mkdir -p $out/ParaView
      tar -xzf ${paraviewTarball} -C $out/ParaView --strip-components=1
      mkdir -p $out/share/icons/hicolor/96x96/apps
      cp $out/ParaView/share/icons/hicolor/apps/paraview.png \
         $out/share/icons/hicolor/96x96/apps/
      # Export des variables nécessaires
      export PATH=$out/ParaView/bin:$PATH
      export LD_LIBRARY_PATH=$out/ParaView/lib:$LD_LIBRARY_PATH
      export QT_PLUGIN_PATH=$out/ParaView/lib/Qt/plugins:$QT_PLUGIN_PATH

      # Lancement direct de ParaView
      exec $out/ParaView/bin/paraview "$@"
      
    '';
  };
}
