{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "nextvi";
  version = "7.8";

  src = fetchFromGitHub {
    owner = "kyx0r";
    repo = "nextvi";
    rev = version;
    hash = "sha256-heIsBDxCx+DKft6slKDw2YG8AdK887e27WlqrUV87bM=";
  };

  dontConfigure = true;

  buildPhase = ''
    # Build vanilla nextvi to apply patches and then build "real" binary
    ./cbuild.sh
    printf "%s\n" "==> Applying patches"
    export VI="''${PWD}/vi"
    # Patches
    ./arrowkeys_insert.sh
    ./arrowkeys_normal.sh
    ./stdin_pipe.sh
    printf "%s\n" "==> Patches applied. Building final binary"
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
