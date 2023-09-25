# OpenCV Ubuntu package for Full-AAR

a script to download opencv + opencv-contrib and build an Ubuntu binary package for use on Jetson machines.

# system requirements

JetPack 5.0.2 (L4T 35.1.0, Ubuntu 20.04 LTS focal)

# building

when building on a Jetson system, you will probably need to increase the swap space available to the system to avoid running out of memory. see https://qengineering.eu/install-opencv-on-jetson-nano.html (section "Enlarge memory swap") for instructions.

simply run:

```shell
DEB_BUILD_OPTIONS=nocheck ./make-package.sh
```

and wait a few hours.

specifying `DEB_BUILD_OPTIONS=nocheck` skips tests, which currently fail. the built opencv seems to work anyway, so maybe the failure is due to test files not being correctly put in place or something.

there may be a signing related error at the end, but it does not matter for our purposes and you should get a usable .deb anyway.

## specifying the opencv version

```shell
DEB_BUILD_OPTIONS=nocheck ./make-package.sh 4.7.0
```

# installing

remove existing opencv packages:

```shell
sudo apt purge 'libopencv*'
```

install the built package:

```shell
sudo dpkg -i opencv-full-aar_4.8.0-1_arm64.deb
```
