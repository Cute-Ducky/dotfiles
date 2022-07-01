#!/bin/sh
pushd ~/.dotfiles
home-manager -f ./users/glenda/home.nix switch
popd
