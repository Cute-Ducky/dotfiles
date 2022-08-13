{ nixpkgs ? import <nixpkgs> {  } }:

let
  pkgs = with nixpkgs; [
   go-task
   git
   dialog
   openssh
   ];

in
  nixpkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = pkgs;
    shellHook = ''
   ./misc/install
  '';

  }


