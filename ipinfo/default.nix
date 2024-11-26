{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "ipinfo";
  version = "20241126";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "9f860f62aba133c10c72f00c27ff0720d9947486";
    hash = "sha256-IKhy2cb/5MqvFH/Bbu2S/dH0xGJ7LZFrI0tLFbLF5fs=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/ipinfo";

  ldflags = [ "-s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to gather information from IPinfo.io";
    platforms = lib.platforms.unix;
  };
}
