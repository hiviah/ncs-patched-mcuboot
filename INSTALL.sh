#!/bin/bash

##############
# Reference for installing - https://docs.nordicsemi.com/bundle/ncs-latest/page/nrf/installation/install_ncs.html

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
VERSION_source="$SCRIPT_DIR"/VERSION.source

source "$VERSION_source"
echo "Using Connect SDK version $VERSION"

# These installs are global, put the toolchain into ~/ncs
nrfutil install toolchain-manager
nrfutil toolchain-manager install --ncs-version "$VERSION"

# Here begins the local Connect SDK repo(s) install with the patch
nrfutil toolchain-manager launch -- west init -m https://github.com/nrfconnect/sdk-nrf --mr "$VERSION"
# Patch that damn sorry-not-sorry-ass of lasagna layer build system
(cd nrf; patch -p1 < ../mcuboot-patch-"$VERSION".diff)

# This pulls in all the repos for the whole Connect SDK
nrfutil toolchain-manager launch -- west update


cat<<END
================!!!===================
================!!!===================

Now run their subshell with one of these, depending which shell you have/want as subshell:

1) nrfutil toolchain-manager launch --shell
2) nrfutil toolchain-manager launch bash
3) nrfutil toolchain-manager launch zsh

Option 2 or 3 is preferred, based on your shell.

Option 1 will run your \$SHELL ($SHELL) but without .bashrc or .zshrc included,
which ends up often as very broken shell. Use only if other options somehow
affect the shell that prevents build.
END

