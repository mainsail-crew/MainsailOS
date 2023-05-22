# Patches

This Folder contains a script to patch MainsailOS to latest changes.

## patch101.sh

This is intended to patch MainsailOS version 1.0.0 to 1.0.1
This fixes an error with WiFi powersave rules.
_**DO NOT RUN THIS ON LATER VERSIONS!!!**_

### Usage:

`curl -sSL https://raw.githubusercontent.com/mainsail-crew/MainsailOS/develop/patches/patch101.sh | bash`

This will ask you for sudo password!

In most cases a reboot is required!

## udev-fix.sh

This is intended to patch udev rules which has a Bug in udev package (version: 247.3-7+deb11u2 or 247.3-7+rpi1+deb11u2).
Which does not create `/dev/serial/by-id` symlinks for your MCU.\
For further details see:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1035094

This is fixed by:
https://github.com/systemd/systemd/pull/25246

What we do:

-   Running `apt-get update`
-   Running `apt-get upgrade --yes`
-   `curl`ing the patched rule file from systemd repo
-   Copying to desired location in `/etc/udev/rules.d/60-serial.rules`

This overwrites behaviour in the default configuration.
Since this is the version of the master branch of systemd/udev there is no further
need to intervention even on updates.

_**NOTE: DO NOT RUN THIS PATCH IF YOU ARE PRINTING!!!**_

### Usage:

`curl -sSL https://raw.githubusercontent.com/mainsail-crew/MainsailOS/develop/patches/udev-fix.sh | bash`

This will ask you for sudo password!

A reboot is essential!
