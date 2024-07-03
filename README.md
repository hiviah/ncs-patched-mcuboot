# nRF Connect SDK with patched mcuboot repository + install script

One `INSTALL.sh` script for install Connect SDK + patch mcuboot

## Prerequisities

Download [nrfutil](https://www.nordicsemi.com/Products/Development-tools/nrf-util) and put
it somewhere in your $PATH.

## What the INSTALL.sh script does (look into it, it's short)

Here is nRF Connect SDK install which does 2 things:

1. Installs nRF Connect SDK
1. In the meantime it will patch mcuboot default repo to use other repo

It also installs toolchain into ~/ncs (this is no-op if already installed)

Makes the manual steps automated so that you don't have to lookup "how tf was the install again?"
when cloning+patching the repo again.

## Usage - installing

Just run, go for cafe and wait until install is finished, it bunch of GB of repos:

        ./INSTALL.sh

## udev rules

In case of using nRF devboard, you may have to put these rules into /etc/udev/rules.d/ :

https://github.com/NordicSemiconductor/nrf-udev/tree/main/nrf-udev_1.0.1-all/lib/udev/rules.d

## References

1. https://docs.nordicsemi.com/bundle/ncs-latest/page/nrf/installation/install_ncs.html
