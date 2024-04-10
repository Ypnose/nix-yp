{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  # nix flake show
  # nix build .#PKG
  # nix log .#PKG
  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      cmd = nixpkgs.legacyPackages.${system};
      build = pkg: cmd.callPackage ./${pkg} {};
      build-static = pkg: cmd.pkgsStatic.callPackage ./${pkg} {};
    in {
      packages.x86_64-linux.dig-only = build "dig-only";
      packages.x86_64-linux.nvi-patched = build "nvi-patched";
      packages.x86_64-linux.openbsd-ed = build-static "openbsd-ed";
      packages.x86_64-linux.s-nail = build "s-nail";
      packages.x86_64-linux.wg = build-static "wg";
      packages.x86_64-linux.wifycon = build "wifycon";
      packages.x86_64-linux.yss = build "yss";
  };
}
