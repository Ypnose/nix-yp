{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "nextvi";
  version = "4.2";

  src = fetchFromGitHub {
    owner = "kyx0r";
    repo = "nextvi";
    rev = version;
    hash = "sha256-pkVUCWWVzPwPEG4NGWOoHrXkQpC245kD/Xbj9wmxR3E=";
  };

  dontConfigure = true;

  buildPhase = ''
    # The patches cannot be applied without nextvi, so build it first
    # before applying patches and then build "real" binary
    ./cbuild.sh
    printf "%s\n" "==> Applying patches"
    export VI="''${PWD}/vi"
    ./arrowkeys_insert.sh
    ./arrowkeys_normal.sh
    ./stdin_pipe.sh
    printf "%s\n" "==> Building final binary"
    ./cbuild.sh clean
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
