# OpenCV Ubuntu package for Full-AAR

a script to download opencv + opencv-contrib and build an Ubuntu binary package for use on Jetson machines.

# building

when building on a Jetson system, you will probably need to increase the swap space available to the system to avoid running out of memory. see https://qengineering.eu/install-opencv-on-jetson-nano.html (section "Enlarge memory swap") for instructions.

simply run:

```shell
./make-package.sh
```

and wait a few hours.

the OpenCV version can be specified as an argument (default is 4.8.0):

```shell
./make-package.sh 4.7.0
```

OpenCV tests take a long time to run, so if you know what you're doing, you can skip them:

```shell
DEB_BUILD_OPTIONS=nocheck ./make-package.sh
```

... TODO ...

# installing

remove existing opencv packages:

```shell
sudo apt purge 'libopencv*'
```

... TODO ...
