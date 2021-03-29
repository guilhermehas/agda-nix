{ pkgs ? import <nixpkgs> {}, agda }:
pkgs.haskellPackages.callPackage ./cabal.nix { inherit agda; }
