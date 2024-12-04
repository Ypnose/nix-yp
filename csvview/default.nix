{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "csvview";
  version = "20241204";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "e59707f09eef69895ed33f970db08ef0d92bc83e";
    hash = "sha256-QCOq9dd3USEF6ofdY7qrsUtFpeKu3bSGfy3FpoqvWYc=";
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
