FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu18.04
ENV CUDA_VERSION 11.8
ENV CUDNN_VERSION 8.6.0.163
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"
LABEL maintainer="kaka <vn503024@gmail.com>"

# Ubuntu 18.04: tzdata issue
# set noninteractive installation
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tzdata locales\
    git wget curl\
    build-essential cmake ninja-build g++ \
    sudo apt-utils \
    pkg-config \
    perl \
    python-dev python3-dev \
    python-pip python3-pip \
    libdbus-1-3 \
    # Libxcb
    '^libxcb.*-dev'\
    libx11-xcb-dev \
    libglu1-mesa-dev \
    libxrender-dev \
    libxi-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    # Qt WebKit\
    ruby bison flex gperf \
    libicu-dev libxslt-dev \
    # Qt WebEngine
    libfontconfig1 libfontconfig1-dev libudev-dev \
    # Qt Multimedia
    libasound2-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer-plugins-good1.0-dev \
    libgstreamer-plugins-bad1.0-dev \
    mesa-common-dev libgl1-mesa-dev

# GStreamer support
RUN apt-get install -y --no-install-recommends \
    libgstreamer1.0-0 \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-doc \
    gstreamer1.0-tools \
    libpulse-mainloop-glib0 \
    alsa-base \
    alsa-utils \
    pulseaudio

# OpenGL support: GLUT / GLFW / GLEW support
# mesa-utils: provides glxgears and glxinfo
# x11-apps: provides xeyes
RUN apt-get install -y --no-install-recommends \
    x11-apps \
    mesa-utils \
    freeglut3-dev \
    libglfw3-dev \
    libglew-dev

RUN apt -y autoremove && \
    apt -y autoclean && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/*

# Set timezone
ENV TZ=Asia/Taipei
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Set locale
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Download Qt5.12.0
RUN cd /opt && \
    wget https://download.qt.io/archive/qt/5.12/5.12.0/single/qt-everywhere-src-5.12.0.tar.xz && \
    tar Jxvf qt-everywhere-src-5.12.0.tar.xz && \
    rm -rf qt-everywhere-src-5.12.0.tar.xz && \
    cd /opt/qt-everywhere-src-5.12.0 &&\
    ./configure -release -opensource -confirm-license -prefix /usr/local/qt5 \
    -nomake examples -nomake tests -no-pch -no-icu -no-cups -no-linuxfb -no-directfb \
    -skip qtgamepad -skip qtdoc -skip qtlocation -skip qtx11extras -skip qtxmlpatterns && \
    make -j$(nproc) && \
    make install

RUN rm -rf /opt/qt-everywhere-src-5.12.0

# Add the binaries (qmake and others) to the path
ENV PATH="/usr/local/qt5/bin:$PATH"
# Add the libraries to the library path
ENV LD_LIBRARY_PATH="/usr/local/qt5/lib:$LD_LIBRARY_PATH"

# Install python3.9 with miniconda
ENV PYTHON_VERSION="3.8"
ENV CONDA_PATH="/opt/conda"
# PLATFORM=$(uname -m) && echo "export PLATFORM=${PLATFORM}" >> ~/.bashrc
ENV PLATFORM="x86_64"
RUN DOWNLOAD_PATH="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-${PLATFORM}.sh" && \
    wget ${DOWNLOAD_PATH} && \
    sudo sh Miniconda3-latest-Linux-${PLATFORM}.sh -b -p ${CONDA_PATH} && \
    # sudo ${CONDA_PATH}/bin/conda update -n base conda && \
    sudo ${CONDA_PATH}/bin/conda install python=${PYTHON_VERSION} && \
    sudo ${CONDA_PATH}/bin/conda clean -y -a && \
    rm -rf Miniconda3-latest-Linux-${PLATFORM}.sh && \
    rm -rf /temp/*
ENV PATH=${CONDA_PATH}/bin:$PATH

# Install PyQt5.12.0
RUN pip install --upgrade pip
RUN pip install pyqt5==5.12.0

# Would cause issue:
#   Cannot mix incompatible Qt library (version 0x50c00) with this library (version 0x50c01)
#
# Qt path
#   ENV PATH="/usr/local/qt5/bin:$PATH"
#   ENV LD_LIBRARY_PATH="/usr/local/qt5/lib:$LD_LIBRARY_PATH"
# So we need to unset `LD_LIBRARY_PATH`
ENV LD_LIBRARY_PATH=""

# libQt5MultimediaQuick.so.5: cannot open shared object file: No such file or directory
# ref: https://stackoverflow.com/questions/61426174/libqt5multimediaquick-so-5-cannot-open-shared-object-file-no-such-file-or-dire
# RUN sudo cp /usr/local/qt5/lib/libQt5MultimediaQuick.so.5  \
#     /home/user/.local/lib/python${PYTHON_VERSION}/site-packages/PyQt5/Qt5/lib/

# nvidia-container-runtime
## can run OpenGL in Container
##   - compute: Enables CUDA compute capabilities.
##   - utility: Enables NVIDIA driver utility capabilities, like nvidia-smi.
##   - graphics: Allows access to the GPU's graphics capabilities.
##   - video: Enables video processing features.
##   - display: Provides access to GPU display features.
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}compute,utility,graphics,video,display


# OpenGL
## This fix: libGL error: No matching fbConfigs or visuals found
ENV LIBGL_ALWAYS_INDIRECT 1
## To fix: QGLXContext: Failed to create dummy context
#ENV QT_QUICK_BACKEND software
