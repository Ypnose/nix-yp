{ lib
, stdenv
, fetchurl
, perl
, ncurses
, openssl
, libidn2
}:

stdenv.mkDerivation rec {
  pname = "s-nail";
  version = "14.9.25";

  src = fetchurl {
    url = "https://www.sdaoden.eu/downloads/s-nail-${version}.tar.xz";
    hash = "sha256-IP8FW+mCm2nUbrxADf5RakDSh9fOgQx0NV1r3Boo2Kk=";
  };

  nativeBuildInputs = [ perl ];
  buildInputs = [ ncurses openssl libidn2 ];

  strictDeps = true;
  dontConfigure = true;

  buildPhase = ''
    make config \
      OPT_GSSAPI=no \
      OPT_POP3=no \
      VAL_PAGER=less \
      VAL_PREFIX=/ \
      VAL_SYSCONFDIR=/etc \
      VAL_MAIL=/var/spool/mail
    make build
  '';

  installPhase = ''
    make DESTDIR=$out packager-install
  '';

  meta = {
    homepage = "https://www.sdaoden.eu/code.html#s-mailx";
    description = "Environment for sending and receiving mail";
    platforms = lib.platforms.unix;
  };
}
