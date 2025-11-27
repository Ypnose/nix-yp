{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "ipinfo";
  version = "20251127";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "9bb3b21dde867f87ebdffdf39cf427be19167207";
    hash = "sha256-Wsh1ue5k0UEkobJ23koNdkOLO4RQUxPq/ga+/G8tuy8=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/ipinfo";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to gather information from IPinfo.io";
    platforms = lib.platforms.unix;
  };
}
