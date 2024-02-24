{ lib
, stdenv
, fetchurl
, pkg-config
, perl
, libidn2
, libtool
, openssl
, libuv
}:

stdenv.mkDerivation rec {
  pname = "bind";
  version = "9.18.24";

  src = fetchurl {
    url = "https://downloads.isc.org/isc/bind9/${version}/${pname}-${version}.tar.xz";
    hash = "sha256-cJ1zAjyRFd2tO6tltsjHmlkBltDRFPXQyiUz29Ut32Y=";
  };

  nativeBuildInputs = [ pkg-config perl ];
  buildInputs = [ libidn2 libtool openssl libuv ];

  configureFlags = [
    "--localstatedir=/var"
    "--disable-chroot"
    "--disable-dnsrps"
    "--disable-doh"
    "--disable-fips-mode"
    "--disable-full-report"
    "--disable-linux-caps"
    "--disable-static"
    "--disable-tcp-fastopen"
    "--with-libidn2"
    "--without-gssapi"
    "--without-json-c"
    "--without-lmdb"
    "--without-libnghttp2"
    "--without-readline"
    "--without-zlib"
  ];

  makeFlags = [ "-C lib" ];

  postInstall = ''
    make -C bin/dig install
    # Headers not needed
    rm -r $out/include/
  '';

  meta = {
    homepage = "https://www.isc.org/bind/";
    description = "dig & other utils from BIND";
    platforms = lib.platforms.unix;
    license = lib.licenses.mpl20;
  };
}
