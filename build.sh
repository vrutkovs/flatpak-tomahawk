#!/bin/sh
set -ex

rm -rf app
flatpak-builder --ccache --require-changes --repo=repo --subject="Nightly build of Tomahawk, `date`" app org.tomahawk.player.json

flatpak build-update-repo --prune --prune-depth=20 repo

# The following commands should be performed once
flatpak --user remote-add --no-gpg-verify nightly-tomahawk ./repo || true
flatpak --user -v install nightly-tomahawk org.tomahawk.player || true

flatpak update --user org.tomahawk.player
