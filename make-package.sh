#!/usr/bin/env bash
set -e

version=$1

if [ ! -n "$version" ]; then
   version=4.8.0
fi

opencv_tarball="opencv_$version.orig.tar.gz"
opencv_contrib_tarball="opencv_contrib_$version.orig.tar.gz"

opencv_dir="opencv-full-aar-$version"
opencv_contrib_dir="$opencv_dir/opencv_contrib"

if [ -d "$opencv_dir" ]; then
    echo "source directory $opencv_dir exists"
else
    if [ -f "$opencv_tarball" ]; then
        echo "tarball $opencv_tarball exists"
    else
        echo 'downloading opencv'
    curl -L -o "$opencv_tarball" "https://github.com/opencv/opencv/archive/refs/tags/$version.tar.gz"
    fi
    echo 'extracting opencv'
    tar xzf "$opencv_tarball"
    mv "opencv-$version" "$opencv_dir"
fi

if [ -d "$opencv_contrib_dir" ]; then
    echo "source directory $opencv_contrib_dir exists"
else
    if [ -f "$opencv_contrib_tarball" ]; then
        echo "tarball $opencv_contrib_tarball exists"
    else
        echo 'downloading opencv_contrib'
        curl -L -o "$opencv_contrib_tarball" "https://github.com/opencv/opencv_contrib/archive/refs/tags/$version.tar.gz"
    fi
    echo 'extracting opencv_contrib'
    tar xzf "$opencv_contrib_tarball" --directory "$opencv_dir"
    mv "$opencv_dir/opencv_contrib-$version" "$opencv_contrib_dir"
fi

debian_dir="$opencv_dir/debian"

echo 'copying debian directory'
if [ -d "$debian_dir" ]; then
    rm -rf "$debian_dir"
fi
cp -a debian "$debian_dir"

cd "$opencv_dir"
# debuild is picky about extra files (opencv_contrib) in the source dir
# so use fakeroot instead
fakeroot debian/rules binary
