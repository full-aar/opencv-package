# OpenCV Ubuntu package for Full-AAR

a script to download opencv + opencv-contrib and build an Ubuntu binary package for use on Jetson machines.

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
