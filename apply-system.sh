#!/bin/sh
pushd ~/.dotfiles
doas nixos-rebuild switch -I nixos_config=./system/configuration.nix
popd
