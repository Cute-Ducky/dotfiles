#!/bin/sh
pushd ~/.dotfiles
doas nixos-container destroy $1 
doas nixos-container create $1 --flake .
doas nixos-container start $1 &
sleep 5
doas nixos-container root-login $1

popd
