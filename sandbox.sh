#!/bin/sh
pushd ~/.dotfiles
doas nixos-container destroy sandbox 
doas nixos-container create sandbox --flake .
doas nixos-container start sandbox &
doas nixos-container root-login sandbox

popd
