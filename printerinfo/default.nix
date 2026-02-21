{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "printerinfo";
  version = "20260221";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "b66a74c7f32b0fc94cb5868b154c1d0dab893de1";
    hash = "sha256-5yrMzQUxwKD+3VJpDRp3abK3AAFWdviwXpYtAuRFAGo=";
  };

  vendorHash = "sha256-95aTIiAZja0HFdrBq4h9EwzNygBOEWlbjRBXLuXYdm4=";

  sourceRoot = "${src.name}/printerinfo";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to show printer info using SNMP";
    platforms = lib.platforms.unix;
  };
}
