#!/bin/sh

set -e
set -u

nix-collect-garbage --delete-old

sudo nix-channel --update
nixos-rebuild switch --use-remote-sudo

nix-store --optimise
