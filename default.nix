{ nixpkgs ? import <nixpkgs> {  } }:

let
  pkgs = with nixpkgs; [
   go-task
   git
   dialog
   ];

in
  nixpkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = pkgs;
    shellHook = ''
   ./misc/install
  '';

  }


