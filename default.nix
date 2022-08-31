{ nixpkgs ? import <nixpkgs> {  } }:

let
  pkgs = with nixpkgs; [
   go-task
   git
   dialog
   openssh
   tailscale
   nixopsUnstable
   gnum4
   refind
   ];

in
  nixpkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = pkgs;
    shellHook = ''
   #./misc/install
   #./misc/m4
  '';

  }


