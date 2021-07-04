################################################################################
##  Dockerfile to build minimal OpenCV img with Python3.8 and Video support   ##
################################################################################
FROM alpine:3.14

MAINTAINER Janos Czentye <czentye@tmit.bme.hu>

ENV LANG=C.UTF-8

ARG OPENCV_VERSION=4.5.2

RUN apk add --update --no-cache python3 py3-setuptools py3-pip && \
    apk add --update --no-cache --virtual opencv-build \
    # Build dependencies
    ninja build-base clang clang-dev cmake pkgconf wget openblas-dev hdf5-dev \
    linux-headers eigen-dev freetype-dev glew-dev harfbuzz-dev lapack-dev \
    libdc1394-dev py3-numpy-dev python3-dev libtbb-dev \
    # Image IO packages
    libjpeg-turbo-dev libpng-dev libwebp-dev tiff-dev \
    openjpeg-dev openjpeg-tools openexr-dev \
    # Video depepndencies
    ffmpeg-libs ffmpeg-dev libavc1394-dev gstreamer-dev \
    gst-plugins-base gst-plugins-base-dev mesa-dev libgphoto2-dev && \
    # Make Python3 as default
    ln -vfs /usr/bin/python3 /usr/local/bin/python && \
    ln -vfs /usr/bin/pip3 /usr/local/bin/pip && \
    # Fix libpng path
    ln -vfs /usr/include/libpng16 /usr/include/libpng && \
    ln -vfs /usr/include/locale.h /usr/include/xlocale.h && \
    # Download OpenCV source
    cd /tmp && \
    wget https://github.com/opencv/opencv/archive/$OPENCV_VERSION.tar.gz && \
    tar -xvzf $OPENCV_VERSION.tar.gz && \
    rm -vrf $OPENCV_VERSION.tar.gz && \
    # Configure
    mkdir -vp /tmp/opencv-$OPENCV_VERSION/build && \
    cd /tmp/opencv-$OPENCV_VERSION/build && \
    cmake \
        # Compiler params
        -G Ninja \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_C_COMPILER=/usr/bin/clang \
        -D CMAKE_CXX_COMPILER=/usr/bin/clang++ \
        -D CMAKE_INSTALL_PREFIX=/usr \
        # No examples
        -D INSTALL_PYTHON_EXAMPLES=NO \
        -D INSTALL_C_EXAMPLES=NO \
        # Support
        -D WITH_IPP=NO \
        -D WITH_1394=NO \
        -D WITH_LIBV4L=NO \
        -D WITH_V4l=YES \
        -D WITH_TBB=YES \
        -D WITH_FFMPEG=YES \
        -D WITH_GPHOTO2=YES \
        -D WITH_GSTREAMER=YES \
        # NO doc test and other bindings
        -D BUILD_DOCS=NO \
        -D BUILD_TESTS=NO \
        -D BUILD_PERF_TESTS=NO \
        -D BUILD_EXAMPLES=NO \
        -D BUILD_opencv_java=NO \
        -D BUILD_opencv_python2=NO \
        -D BUILD_ANDROID_EXAMPLES=NO \
        # Build Python3 bindings only
        -D PYTHON3_LIBRARY=$(find /usr -name libpython3.so) \
        -D PYTHON_EXECUTABLE=$(which python3) \
        -D PYTHON3_EXECUTABLE=$(which python3) \
        -D BUILD_opencv_python3=YES .. && \
    # Build
    ninja && \
    ninja install && \
    # Cleanup
    cd / && rm -vrf /tmp/opencv-$OPENCV_VERSION && \
    apk del --purge opencv-build && \
    apk add --update --no-cache openblas libjpeg-turbo libpng libwebp tiff openjpeg openexr ffmpeg ffmpeg-libs \
                       libgphoto2 libtbb gst-plugins-base gstreamer \
                       libdc1394 libgcc libstdc++ mesa-gl musl zlib && \
    rm -vrf /var/cache/apk/*
