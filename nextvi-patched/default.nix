{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "nextvi";
  version = "7.0";

  src = fetchFromGitHub {
    owner = "kyx0r";
    repo = "nextvi";
    rev = version;
    hash = "sha256-corF/cPmkCkpqg2UVLrMHL33pgp3ffBohbQzq95b+Ws=";
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
