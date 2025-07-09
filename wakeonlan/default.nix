{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "wakeonlan";
  version = "20250609";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "c2541b65a5b4a77fc0e739be5406bff695335055";
    hash = "sha256-hb1N2UPkNuuXlV14UrFz0QPZ/Ye2HTRZL6vCcasX+VI=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/wakeonlan";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to send Wake-on-LAN magic packet";
    platforms = lib.platforms.unix;
  };
}
