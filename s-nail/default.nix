{ lib
, stdenv
, fetchurl
, perl
, ncurses
, openssl
, libidn2
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "s-nail";
  version = "14.9.24";

  src = fetchurl {
    url = "https://www.sdaoden.eu/downloads/s-nail-${finalAttrs.version}.tar.xz";
    hash = "sha256-JxTWuPsq87Nj/Hx5t20Fh1NxY0XRtuvNiHDs0OT374w=";
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
})
