{ fetchurl, appimageTools, lib }:

let 
  pname = "feishin";
  version = "0.19.0";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://github.com/jeffvli/feishin/releases/download/v${version}/Feishin-linux-x86_64.AppImage";
    sha256 = "a133b3cd9c6feb75b5199ca7c2ab108f47dbfed3977db0f828b0afcfd6aad76c";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 rec {
  inherit pname version src;
  
  extraInstallCommands = ''
#    mv $out/bin/${pname} $out/bin/${pname}
    install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications/${pname}.desktop

    install -m 444 -D ${appimageContents}/${pname}.png $out/share/icons/hicolor/512x512/apps/${pname}.png

    substituteInPlace $out/share/applications/${pname}.desktop \
    	--replace 'Exec=AppRun' 'Exec=${pname}'
  '';
  meta = with lib; {
    description = "Feishin music player AppImage";
    homepage = "https://github.com/jeffvli/feishin";
    license = licenses.gpl3;
    platforms = [ "x86_64-linux" ];
  };
}
