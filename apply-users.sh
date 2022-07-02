#!/bin/sh
pushd ~/.dotfiles
nix build .#homeManagerConfigurations.glenda.activationPackage
./result/activate
popd
