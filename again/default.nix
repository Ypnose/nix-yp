{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "again";
  version = "20241204";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "e59707f09eef69895ed33f970db08ef0d92bc83e";
    hash = "sha256-QCOq9dd3USEF6ofdY7qrsUtFpeKu3bSGfy3FpoqvWYc=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/again";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to execute commands repeatedly";
    platforms = lib.platforms.unix;
  };
}
