self: super: {
  wf-config = super.wf-config.overrideAttrs (oldAttrs: {
    version = "0.10.0";
    src = super.fetchFromGitHub {
      owner = "WayfireWM";
      repo = "wf-config";
      rev = "refs/tags/v0.10.0";
      sha256 = "WcGt6yl2LpLnAOVtiCyMyWsoMAUMG1MYhvW/m2DDMX4=";
    };
    buildInputs = (oldAttrs.buildInputs or []) ++ [ super.libxml2 ];
  });

  wayfirePlugins = super.wayfirePlugins // {
    wayfire-plugins-extra = super.wayfirePlugins.wayfire-plugins-extra.overrideAttrs (oldAttrs: {
      version = "0.10.0";
      src = super.fetchFromGitHub {
        owner = "WayfireWM";
        repo = "wayfire-plugins-extra";
        rev = "refs/tags/v0.10.0";
        sha256 = "0cAPaj5PmGgX/Q0mkdsyjZTQ5JBPrnvB2EnLj89v13g=";
      };
      buildInputs = (oldAttrs.buildInputs or []) ++ [
        super.boost
        super.libdrm
        super.vulkan-headers
      ];
      mesonFlags = let
        flags = oldAttrs.mesonFlags or [];
      in
        builtins.filter (flag: !(flag == (super.lib.mesonBool "enable_windecor" false))) flags;
    });

    wcm = super.wayfirePlugins.wcm.overrideAttrs (oldAttrs: {
      version = "0.10.0";
      src = super.fetchFromGitHub {
        owner = "WayfireWM";
        repo = "wcm";
        rev = "refs/tags/v0.10.0";
        sha256 = "O4BYwb+GOMZIn3I2B/WMJ5tUZlaegvwBuyNK9l/gxvQ=";
      };
      mesonFlags = let
        flags = oldAttrs.mesonFlags or [];
      in
        builtins.filter (flag: flag != "-Denable_wdisplays=false") flags;
    });

    wf-shell = super.wayfirePlugins.wf-shell.overrideAttrs (oldAttrs: {
      version = "0.10.0";
      src = super.fetchFromGitHub {
        owner = "WayfireWM";
        repo = "wf-shell";
        rev = "v0.10.0";
        fetchSubmodules = true;
        sha256 = "PLTeFGecxVwU2LdwnDwiWB1OcbaZjJemMpT0pcCFf/w=";
      };

      nativeBuildInputs = [
        super.meson
        super.ninja
        super.pkg-config
        super.wayland-scanner
      ];

      buildInputs = [
        self.wayfire
        super.alsa-lib
        super.gtkmm3
        super.gtk-layer-shell
        super.pulseaudio
        super.libdbusmenu-gtk3
        super.libxml2
      ];

      mesonFlags = [ "--sysconfdir /etc" ];

      meta = {
        homepage = "https://github.com/WayfireWM/wf-shell";
        description = "GTK3-based panel for Wayfire";
        license = super.lib.licenses.mit;
        maintainers = with super.lib.maintainers; [ super.wucke13 super.rewine ];
        platforms = super.lib.platforms.unix;
      };
    });
  };

  wayfire = super.stdenv.mkDerivation (finalAttrs: {
    pname = "wayfire";
    version = "0.10.0";
    src = super.fetchFromGitHub {
      owner = "WayfireWM";
      repo = "wayfire";
      rev = "v${finalAttrs.version}";
      fetchSubmodules = true;
      hash = "sha256-rnrcuikfRPnIfIkmKUIRh8Sm+POwFLzaZZMAlmeBdjY=";
    };

    nativeBuildInputs = [
      super.meson
      super.ninja
      super.pkg-config
      super.wayland-scanner
    ];

    buildInputs = [
      super.libGL
      super.libdrm
      super.libexecinfo
      super.libevdev
      super.libinput
      super.libjpeg
      super.libxkbcommon
      super.wayland-protocols
      super.xorg.xcbutilwm
      super.yyjson
      super.libxml2
      super.vulkan-headers
    ];

    propagatedBuildInputs = [
      self.wf-config
      super.wlroots
      super.wayland
      super.cairo
      super.pango
    ];

    nativeCheckInputs = [
      super.cmake
      super.doctest
    ];

    postPatch = ''
      substituteInPlace plugins/common/wayfire/plugins/common/cairo-util.hpp \
        --replace "<drm_fourcc.h>" "<libdrm/drm_fourcc.h>"
    '';

    dontUseCmakeConfigure = true;
    doCheck = true;

    mesonFlags = [
      "--sysconfdir /etc"
      "-Duse_system_wlroots=enabled"
      "-Duse_system_wfconfig=enabled"
      (super.lib.mesonEnable "wf-touch:tests" (super.stdenv.buildPlatform.canExecute super.stdenv.hostPlatform))
    ];

    passthru.providedSessions = [ "wayfire" ];
    passthru.tests.mate = super.nixosTests.mate-wayland;

    meta = {
      homepage = "https://wayfire.org/";
      description = "3D Wayland compositor";
      license = super.lib.licenses.mit;
      maintainers = with super.lib.maintainers; [ wucke13 rewine ];
      platforms = super.lib.platforms.unix;
      mainProgram = "wayfire";
    };
  });
}
