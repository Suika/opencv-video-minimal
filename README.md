# OpenCV 4.5.0 with Python3.8 and video support

[![](https://img.shields.io/docker/pulls/suika/opencv-video-minimal)](https://hub.docker.com/r/suika/opencv-video-minimal)
[![](https://img.shields.io/docker/image-size/suika/opencv-video-minimal/latest)](https://hub.docker.com/r/suika/opencv-video-minimal)
[![](https://img.shields.io/static/v1?label=ghcr.io&message=available&color=success)](https://github.com/users/Suika/packages/container/package/opencv-video-minimal)


János Czentye, HSNLab@BME, Suika

2020 December

### Description

This repository provides a Dockerfile for building an image for the latest 
OpenCV with Python3.8 bindings and video support for video processing.

The Docker image is based on the latest Alpine Linux 3.10 for a minimum size 
image (~217MB). It uses Alpine packages from testing and community repos.

https://alpinelinux.org

The OpenCV lib is compiled from source and contains no contrib modules.

https://github.com/opencv/opencv/releases

Older versions can be found under different tags.

### Configuration

The OpenCV compiled from source with the following configurations:

```text
General configuration for OpenCV 4.5.0 =====================================
  Version control:               unknown

  Platform:
    Timestamp:                   2020-11-28T02:59:43Z
    Host:                        Linux 4.15.18-10-pve x86_64
    CMake:                       3.17.2
    CMake generator:             Unix Makefiles
    CMake build tool:            /usr/bin/make
    Configuration:               RELEASE

  CPU/HW features:
    Baseline:                    SSE SSE2 SSE3
      requested:                 SSE3
    Dispatched code generation:  SSE4_1 SSE4_2 FP16 AVX AVX2 AVX512_SKX
      requested:                 SSE4_1 SSE4_2 AVX FP16 AVX2 AVX512_SKX
      SSE4_1 (15 files):         + SSSE3 SSE4_1
      SSE4_2 (1 files):          + SSSE3 SSE4_1 POPCNT SSE4_2
      FP16 (0 files):            + SSSE3 SSE4_1 POPCNT SSE4_2 FP16 AVX
      AVX (4 files):             + SSSE3 SSE4_1 POPCNT SSE4_2 AVX
      AVX2 (29 files):           + SSSE3 SSE4_1 POPCNT SSE4_2 FP16 FMA3 AVX AVX2
      AVX512_SKX (4 files):      + SSSE3 SSE4_1 POPCNT SSE4_2 FP16 FMA3 AVX AVX2 AVX_512F AVX512_COMMON AVX512_SKX

  C/C++:
    Built as dynamic libs?:      YES
    C++ standard:                11
    C++ Compiler:                /usr/bin/clang++  (ver 10.0.0)
    C++ flags (Release):         -fsigned-char -W -Wall -Werror=return-type -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Winit-self -Winconsistent-missing-override -Wno-delete-non-virtual-dtor -Wno-unnamed-type-template-args -Wno-comment -Wno-deprecated-enum-enum-conversion -Wno-deprecated-anon-enum-enum-conversion -fdiagnostics-show-option -Wno-long-long -pthread -Qunused-arguments -ffunction-sections -fdata-sections  -msse -msse2 -msse3 -fvisibility=hidden -fvisibility-inlines-hidden -O3 -DNDEBUG  -DNDEBUG
    C++ flags (Debug):           -fsigned-char -W -Wall -Werror=return-type -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Winit-self -Winconsistent-missing-override -Wno-delete-non-virtual-dtor -Wno-unnamed-type-template-args -Wno-comment -Wno-deprecated-enum-enum-conversion -Wno-deprecated-anon-enum-enum-conversion -fdiagnostics-show-option -Wno-long-long -pthread -Qunused-arguments -ffunction-sections -fdata-sections  -msse -msse2 -msse3 -fvisibility=hidden -fvisibility-inlines-hidden -g  -O0 -DDEBUG -D_DEBUG
    C Compiler:                  /usr/bin/clang
    C flags (Release):           -fsigned-char -W -Wall -Werror=return-type -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Winit-self -Winconsistent-missing-override -Wno-delete-non-virtual-dtor -Wno-unnamed-type-template-args -Wno-comment -Wno-deprecated-enum-enum-conversion -Wno-deprecated-anon-enum-enum-conversion -fdiagnostics-show-option -Wno-long-long -pthread -Qunused-arguments -ffunction-sections -fdata-sections  -msse -msse2 -msse3 -fvisibility=hidden -fvisibility-inlines-hidden -O3 -DNDEBUG  -DNDEBUG
    C flags (Debug):             -fsigned-char -W -Wall -Werror=return-type -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Winit-self -Winconsistent-missing-override -Wno-delete-non-virtual-dtor -Wno-unnamed-type-template-args -Wno-comment -Wno-deprecated-enum-enum-conversion -Wno-deprecated-anon-enum-enum-conversion -fdiagnostics-show-option -Wno-long-long -pthread -Qunused-arguments -ffunction-sections -fdata-sections  -msse -msse2 -msse3 -fvisibility=hidden -fvisibility-inlines-hidden -g  -O0 -DDEBUG -D_DEBUG
    Linker flags (Release):      -Wl,--gc-sections -Wl,--as-needed
    Linker flags (Debug):        -Wl,--gc-sections -Wl,--as-needed
    ccache:                      NO
    Precompiled headers:         NO
    Extra dependencies:          dl m pthread rt
    3rdparty dependencies:

  OpenCV modules:
    To be built:                 calib3d core dnn features2d flann gapi highgui imgcodecs imgproc ml objdetect photo python3 stitching video videoio
    Disabled:                    world
    Disabled by dependency:      -
    Unavailable:                 java js python2 ts
    Applications:                apps
    Documentation:               NO
    Non-free algorithms:         NO

  GUI:
    GTK+:                        NO
    VTK support:                 NO

  Media I/O:
    ZLib:                        /lib/libz.so (ver 1.2.11)
    JPEG:                        /usr/lib/libjpeg.so (ver 80)
    WEBP:                        /usr/lib/libwebp.so (ver encoder: 0x020f)
    PNG:                         /usr/lib/libpng.so (ver 1.6.37)
    TIFF:                        /usr/lib/libtiff.so (ver 42 / 4.1.0)
    JPEG 2000:                   OpenJPEG (ver 2.3.1)
    OpenEXR:                     /usr/lib/libImath-2_4.so /usr/lib/libIlmImf-2_4.so /usr/lib/libIex-2_4.so /usr/lib/libHalf-2_4.so /usr/lib/libIlmThread-2_4.so (ver 2_4)
    HDR:                         YES
    SUNRASTER:                   YES
    PXM:                         YES
    PFM:                         YES

  Video I/O:
    FFMPEG:                      YES
      avcodec:                   YES (58.91.100)
      avformat:                  YES (58.45.100)
      avutil:                    YES (56.51.100)
      swscale:                   YES (5.7.100)
      avresample:                YES (4.0.0)
    GStreamer:                   YES (1.16.2)
    v4l/v4l2:                    YES (linux/videodev2.h)
    gPhoto2:                     YES

  Parallel framework:            TBB (ver 2020.3 interface 11103)

  Trace:                         YES (with Intel ITT)

  Other third-party libraries:
    Lapack:                      YES (/usr/lib/libopenblas.so)
    Eigen:                       NO
    Custom HAL:                  NO
    Protobuf:                    build (3.5.1)

  OpenCL:                        YES (no extra features)
    Include path:                /tmp/opencv-4.5.0/3rdparty/include/opencl/1.2
    Link libraries:              Dynamic load

  Python 3:
    Interpreter:                 /usr/bin/python3 (ver 3.8.5)
    Libraries:                   /usr/lib/libpython3.so (ver 3.8.5)
    numpy:                       /usr/lib/python3.8/site-packages/numpy/core/include (ver 1.19.4)
    install path:                lib/python3.8/site-packages/cv2/python-3.8

  Python (for build):            /usr/bin/python3

  Java:
    ant:                         NO
    JNI:                         NO
    Java wrappers:               NO
    Java tests:                  NO

  Install to:                    /usr
-----------------------------------------------------------------

```

### Download

To get the image use:
```sh
sudo docker pull suika/opencv-video-minimal
sudo docker pull ghcr.io/suika/opencv-video-minimal
```

### Run

To run Python with Matplotlib use the following command ``sudo docker run -ti suika/opencv-video-minimal python``

### License

Licensed under MIT license, see LICENSE file.
