# Contributor: Marian Buschsieweke <marian.buschsieweke@ovgu.de>
# Maintainer: Bart Ribbers <bribbers@disroot.org>
pkgname=opencv
pkgver=4.5.2
pkgrel=0
pkgdesc="An open source computer vision and machine learning library"
url="https://opencv.org"
# Other arches blocked by vtk-dev
arch="all"
license="BSD-3-Clause"
subpackages="$pkgname-dbg $pkgname-dev"
depends_dev="
        blas-dev
        eigen-dev
        ffmpeg-dev
        freetype-dev
        glew-dev
        gstreamer-dev
        harfbuzz-dev
        hdf5-dev
        lapack-dev
        libdc1394-dev
        libgphoto2-dev
        libtbb-dev
        mesa-dev
        openexr-dev
        openjpeg-dev
        openjpeg-tools
        py3-setuptools
        qt5-qtbase-dev
        py3-numpy-dev
        vtk-dev
        "
makedepends="$depends_dev
        cmake
        ninja
        python3
        python3-dev
        "
source="https://github.com/opencv/opencv/archive/$pkgver/opencv-$pkgver.tar.gz
        https://github.com/opencv/opencv_contrib/archive/$pkgver/opencv_contrib-$pkgver.tar.gz
        "
# Tests require human interaction
# net required to download a data file (face_landmark_model.dat)
options="net !check"

# vtk is only provided on x86_64
case "$CARCH" in
        x86_64)
                _extra_cmake_flags="-DCPU_BASELINE_DISABLE=SSE3 -DCPU_BASELINE_REQUIRE=SSE2"
                ;;
esac

prepare() {
        default_prepare

        cd "$srcdir/opencv_contrib-$pkgver"/modules
        # Only use modules that we care about
        mv \
                aruco \
                face \
                tracking \
                optflow \
                plot \
                shape \
                superres \
                videostab \
                ximgproc \
                "$builddir"/modules/
}

build() {
        cmake -B build \
                -G Ninja \
                -DCMAKE_BUILD_TYPE=None \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_INSTALL_LIBDIR=lib \
                -DWITH_OPENCL=ON \
                -DWITH_OPENGL=ON \
                -DWITH_TBB=ON \
                -DWITH_VULKAN=ON \
                -DWITH_QT=ON \
                -DWITH_ADE=OFF \
                -DWITH_opencv_gapi=OFF \
                -DWITH_IPP=OFF \
                -DBUILD_WITH_DEBUG_INFO=ON \
                -DBUILD_TESTS=OFF \
                -DBUILD_PERF_TESTS=OFF \
                -DBUILD_EXAMPLES=OFF \
                -DINSTALL_C_EXAMPLES=OFF \
                -DINSTALL_PYTHON_EXAMPLES=OFF \
                -DOPENCV_SKIP_PYTHON_LOADER=ON \
                -DOPENCV_GENERATE_PKGCONFIG=ON \
                -DOPENCV_ENABLE_NONFREE=OFF \
                -DOPENCV_GENERATE_SETUPVARS=OFF \
                -DEIGEN_INCLUDE_PATH=/usr/include/eigen3 \
                -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so" \
                -DCMAKE_SKIP_INSTALL_RPATH=ON \
                -DPYTHON_EXECUTABLE=/usr/bin/python3 \
                -DPYTHON3_EXECUTABLE=/usr/bin/python3 \
                -DPYTHON3_LIBRARY=/usr/lib/libpython3.so \
                -DBUILD_opencv_python3=YES \
                $_extra_cmake_flags
        cmake --build build
}

check() {
        cd build
        CTEST_OUTPUT_ON_FAILURE=TRUE ctest
}

package() {
        DESTDIR="$pkgdir" cmake --install build
}

samples() {
        pkgdesc="OpenCV Samples"
        depends="$pkgname=$pkgver"
        mkdir -p "$subpkgdir/usr/share/opencv4"
        mv "$pkgdir/usr/share/opencv4/samples" "$subpkgdir/usr/share/opencv4"
}

sha512sums="
07788ec49801bdab963a057871e81fc2b081149c75764810197766d987e54db0d6fd142d2397bbbacefcea6a8be100235ea886ee7e5d5c07ed1156e76249dfec  opencv-4.5.2.tar.gz
72ce91dfefc1c3e12cc8e965d90392cfed6c236daafb512aafc14cdad83242bfa0fc1adea308cd07a5483e010633e2996c3b239b2ce12cea47e6e21c36ed398b  opencv_contrib-4.5.2.tar.gz
"
