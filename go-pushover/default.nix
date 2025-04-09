{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "go-pushover";
  version = "20250409";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "11affc78a0d49ca269c4a57bd8c3a854b6b70f6b";
    hash = "sha256-oeLFi5V21OSwUnpnj4rXG3qy0Bo6t6AkCzfKFRQpUOU=";
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
