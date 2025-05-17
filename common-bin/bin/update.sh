#!/bin/sh

set -e
set -u

nix-collect-garbage --delete-old
nixos-rebuild switch --use-remote-sudo
nix-store --optimise
