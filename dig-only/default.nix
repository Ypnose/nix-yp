{ lib
, stdenv
, fetchurl
, pkg-config
, perl
, libidn2
, libtool
, openssl
, libuv
, liburcu
, libcap
}:

stdenv.mkDerivation rec {
  pname = "bind";
  version = "9.20.27";

  src = fetchurl {
    url = "https://downloads.isc.org/isc/bind9/${version}/${pname}-${version}.tar.xz";
    hash = "sha256-FFq3pQszoG2dSIteZoyIfnVPQqz4lU4rXcfiOLCA5KA=";
  };

  nativeBuildInputs = [ pkg-config perl ];
  buildInputs = [ libidn2 libtool openssl libuv liburcu libcap ];

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
  enableParallelBuilding = true;

  postInstall = ''
    make -C bin/dig install
    # Headers not needed
    rm -r "$out/include/"
  '';

  meta = {
    homepage = "https://www.isc.org/bind/";
    description = "dig & other utils from BIND";
    platforms = lib.platforms.unix;
    license = lib.licenses.mpl20;
  };
}
