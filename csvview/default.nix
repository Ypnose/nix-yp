{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "csvview";
  version = "20241126";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "a7843a052e3f095b425060209eeea4d111f84cf1";
    hash = "sha256-5VZgq3FYiclGNcxEWWmQ8PlYbVKxbGaIAm/DWuJpmJo=";
  };

  vendorHash = "sha256-m/ASIIuV5W/KNw1YBXrQTLiTSdHA7R3ir5+Ivb3W6Ns=";

  sourceRoot = "${src.name}/csvview";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to view and edit CSV files";
    platforms = lib.platforms.unix;
  };
}
