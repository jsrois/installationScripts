#!/bin/bash

ex () {
	echo "==========================================================================="
	echo $*
	eval "$* || exit 1"
}


ex "sudo apt-get update"
ex "sudo apt-get install build-essential"
ex "sudo apt-get purge git"
ex "sudo apt-get purge yasm"
ex "sudo apt-get purge libicu-dev"

ex "sudo apt-get install git"
ex "sudo apt-get install yasm"
ex "sudo apt-get install libicu-dev"

ex "sudo apt-get purge cmake"
ex "sudo apt-get autoremove"

ex "sudo apt-get purge libjpeg8-dev"
ex "sudo apt-get purge libjasper-dev libpng++-dev libglib2.0-dev zlib1g-dev"
ex "sudo apt-get purge libavformat-dev libswscale-dev"
ex "sudo apt-get purge ffmpeg libgstreamer0.10-dev libv4l-dev libunicap2-dev  libdc1394-22-dev"
ex "sudo apt-get autoremove"

ex "sudo apt-get install libjpeg8-dev"
ex "sudo apt-get install libjasper-dev libpng++-dev libglib2.0-dev zlib1g-dev libgtk2.0-dev"


mkdir ffmpeg
pushd ffmpeg
cd ffmpeg
git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg
cd ffmpeg
./configure --enable-shared
sudo make -j 4
sudo make install
sudo ldconfig
popd

ex "sudo apt-get purge qtcreator"
ex "sudo apt-get purge cmake-qt-gui"
ex "sudo apt-get purge libqt4-sql-mysql"
ex "sudo apt-get autoremove"

ex "sudo apt-get install qtcreator"
ex "sudo apt-get install cmake-qt-gui"
ex "sudo ldconfig"

ex "wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.8/opencv-2.4.8.zip"
ex "unzip openCV-2.4.8.zip"

ex "pushd openCV-2.4.8"
ex "sudo mkdir build"
ex "cmake-gui ."
ex "sudo make -j 4"
ex "sudo make install"
ex "sudo ldconfig"
ex "popd"

echo "bye.."

