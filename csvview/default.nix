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
    rev = "adc3fbb77089190c237f31845b591821e9a8a874";
    hash = "sha256-Pg/HpEDyELM8eW5h0832dcM7aUgtpZchygB+XYol7SY=";
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
