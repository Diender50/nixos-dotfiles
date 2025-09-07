self: super:

let
  stdenv = super.stdenv;
  lib = super.lib;
  fetchFromGitHub = super.fetchFromGitHub;
  meson = super.meson;
  ninja = super.ninja;
  pkg-config = super.pkg-config;
  libglvnd.dev = super.libglvnd.dev;
  libxkbcommon = super.libxkbcommon;
  libdrm = super.libdrm;
  vulkan-headers = super.vulkan-headers;
  xorg.xcbutilwm = super.xorg.xcbutilwm;
  libinput = super.libinput;
in

{
  pixdecor = stdenv.mkDerivation rec {
    pname = "pixdecor";
    version = "0.1.0";

    src = fetchFromGitHub {
      owner = "soreau";
      repo = "pixdecor";
      rev = "fd86578";
      sha256 = "JfdHP8x8hf8PvYF/q75m5dt9p9EqeZUxJJBVKFK/dcw=";  # À remplacer par la valeur réelle après un premier build
      fetchSubmodules = true;
    };

    nativeBuildInputs = [
      meson
      ninja
      pkg-config
    ];

    buildInputs = [
      super.wayfire 
      libglvnd.dev
      libxkbcommon
      libdrm
      vulkan-headers
      xorg.xcbutilwm
      libinput
    ];

    # Permet d'ajouter les options et arguments spécifiques du meson.build

    # Définition des arguments pour la compilation depuis le meson.build
    # Ici on reproduit les defines et linker flags détectés dans le meson.build
    mesonFlags = [
      "--prefix=/share/wayfire-plugins/pixdecor"
      "-Ddefault_library=shared"
      # On force la variable metadata pour que pixdecor installe ses fichiers au bon endroit
      "-Dmetadata-dir=/share/wayfire-plugins/pixdecor/metadata"
    ];

    # surcharge possible du linker arguments via NIX_CXX_FLAGS
    NIX_CXX_FLAGS = "-rdynamic -fPIC";
    installPhase = ''
      substituteInPlace meson.build --replace "wayfire.get_variable(pkgconfig: 'metadatadir')" "'${placeholder:metadataDir}'"
      meson install
    '';
    meta = with lib; {
      description = "Wayfire plugin for decoration features";
      homepage = "https://github.com/soreau/pixdecor";
      license = licenses.mit;
      platforms = platforms.linux;  # Wayfire est Linux-only
      maintainers = with maintainers; [ ];  # Ajouter si vous connaissez le mainteneur
    };
  };
}
