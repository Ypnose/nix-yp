{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "nextvi";
  version = "4.0";

  src = fetchFromGitHub {
    owner = "kyx0r";
    repo = "nextvi";
    rev = version;
    hash = "sha256-zX4m4y/y9kt/9dfEauLry+LdgcvSs+3s1OVPL52Ecok=";
  };

  patchPhase = ''
    ./arrowkeys_insert.sh patch
    ./arrowkeys_normal.sh patch
    ./stdin_pipe.sh patch
  '';

  dontConfigure = true;

  buildPhase = ''
    ./cbuild.sh
  '';

  installPhase = ''
    PREFIX="$out" ./cbuild.sh install
  '';

  meta = with lib; {
    description = "A small vi/ex terminal text editor";
    homepage = "https://github.com/kyx0r/nextvi";
    license = licenses.mit;
    platforms = platforms.unix;
    mainProgram = "nextvi";
  };
}
