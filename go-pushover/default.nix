{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "go-pushover";
  version = "20260105";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "e93830713023273c778257579a1daa6895fbecff";
    hash = "sha256-cvoKMjC8qzkuCL1bKwFuenYjQkOtpR4o8fF8sAo8f1k=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/go-pushover";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to send data to Pushover Message API";
    platforms = lib.platforms.unix;
  };
}
