{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "wakeonlan";
  version = "20260221";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "b66a74c7f32b0fc94cb5868b154c1d0dab893de1";
    hash = "sha256-5yrMzQUxwKD+3VJpDRp3abK3AAFWdviwXpYtAuRFAGo=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/wakeonlan";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "Simple tool to send Wake-on-LAN magic packet";
    homepage = "https://github.com/Ypnose/gools";
    platforms = platforms.unix;
    mainProgram = "wakeonlan";
  };
}
