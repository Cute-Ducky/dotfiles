#!/bin/sh
pushd ~/.dotfiles
doas nixos-rebuild --flake .#nixos switch
popd
