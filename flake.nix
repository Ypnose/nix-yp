{
  description = "Collection of various packages and tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  # nix flake show
  # nix hash to-sri sha256:HASH
  # nix build .#PKG
  # nix log .#PKG
  outputs = { self, nixpkgs, ... }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      mkPackages = system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          build = pkg: pkgs.callPackage ./${pkg} {};
          build-static = pkg: pkgs.pkgsStatic.callPackage ./${pkg} {};
        in {
          again = build "again";
          apacheds = build "apacheds";
          csvview = build "csvview";
          dig-only = build "dig-only";
          dmarcreport = build "dmarcreport";
          emltombox = build "emltombox";
          go-pushover = build "go-pushover";
          ipinfo = build "ipinfo";
          nvi-patched = build "nvi-patched";
          openbsd-ed = build-static "openbsd-ed";
          printerinfo = build "printerinfo";
          s-nail = build "s-nail";
          sponge = build "sponge";
          tempo = build "tempo";
          thermal = build "thermal";
          utfdumpcode = build "utfdumpcode";
          vipe = build "vipe";
          wakeonlan = build "wakeonlan";
          wg = build-static "wg";
          wifycon = build "wifycon";
          yss = build "yss";
        };
    in {
      packages = forAllSystems mkPackages;
    };
}
