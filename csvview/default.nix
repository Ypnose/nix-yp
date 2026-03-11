{ lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "csvview";
  version = "20260221";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "b66a74c7f32b0fc94cb5868b154c1d0dab893de1";
    hash = "sha256-5yrMzQUxwKD+3VJpDRp3abK3AAFWdviwXpYtAuRFAGo=";
  };

  vendorHash = "sha256-ew4OejtBoLuAnT2GbQWKSbvO9efLw/BUKfhSmX4y7c0=";

  sourceRoot = "${src.name}/csvview";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "Simple tool to view and edit CSV files";
    homepage = "https://github.com/Ypnose/gools";
    platforms = platforms.unix;
    mainProgram = "csvview";
  };
}
