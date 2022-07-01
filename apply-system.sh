#!/bin/sh
pushd ~/.dotfiles
doas nixos-rebuild switch -I nixos-config=./system/configuration.nix
popd
