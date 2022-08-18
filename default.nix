{ nixpkgs ? import <nixpkgs> {  } }:

let
  pkgs = with nixpkgs; [
   go-task
   git
   dialog
   openssh
   nixops
   tailscale
   nixops
   gnum4
   ];

in
  nixpkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = pkgs;
    shellHook = ''
   #./misc/install
   ./misc/m4
  '';

  }


