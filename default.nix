{ nixpkgs ? import <nixpkgs> {  } }:

let
  pkgs = with nixpkgs; [
   go-task
   git
   ];

in
  nixpkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = pkgs;
  }


