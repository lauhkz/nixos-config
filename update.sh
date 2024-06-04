#!/usr/bin/env bash

pushd ~/x280
sudo nixos-rebuild switch --flake .#x280
popd


