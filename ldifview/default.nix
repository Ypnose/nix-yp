{ lib
, stdenv
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "ldifview";
  version = "20250924";

  src = fetchFromGitHub {
    owner = "ypnose";
    repo = "gools";
    rev = "9bff8f9dbc22c3202b5dbf020f9e9bbe4ac1d260";
    hash = "sha256-J8c9Jcvn9MkRALZDl8iqkQpDaxfnfkjL4tszFFiTPuk=";
  };

  vendorHash = null;

  sourceRoot = "${src.name}/ldifview";

  ldflags = [ "-w -s" ];

  meta = {
    homepage = "https://github.com/Ypnose/gools";
    description = "Simple tool to display LDAP directory structure from LDIF";
    platforms = lib.platforms.unix;
  };
}
