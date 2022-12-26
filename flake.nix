{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    idris-lang.url = "github:idris-lang/Idris2";
    idris-lang.inputs.nixpkgs.follows = "nixpkgs";
    # XXX: LUTI' HACK
    idris2-aoc.url = "github:NobbZ/aoc-idr";
    idris2-aoc.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, idris-lang, idris2-aoc }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        idrisPkgs = idris-lang.packages.${system};
        idris2 = ((idris2-aoc.packages.x86_64-linux.idris2.override { withSource = true; }).overrideAttrs (old: {
          inherit (idris-lang.packages.${system}.idris2) version src;
        }));
      in {
        devShells.default =
          pkgs.mkShell { buildInputs = [ idris2 ]; };
      });
}
