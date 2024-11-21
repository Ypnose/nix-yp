{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule {
  pname = "go-pushover";
  version = "20241121";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "go-pushover";
    rev = "03659a31f3275c964f862c896bd24ab2a4d4d1eb";
    hash = "sha256-Ssv5U6QsL8YnQlTQX2X/PiNYrDyjoR6Qmogy8vcoGaw=";
  };

  vendorHash = null;

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/go-pushover";
    description = "Simple tool to send data to Pushover Message API";
    platforms = lib.platforms.unix;
  };
}
