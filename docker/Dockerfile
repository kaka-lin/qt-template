FROM ubuntu:18.04
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
    perl ruby bison flex gperf \
    python-dev python3-dev \
    python-pip python3-pip \
    '^libxcb.*-dev'\
    libx11-xcb-dev \
    libglu1-mesa-dev \
    libxrender-dev \
    libxi-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    libdbus-1-3 \
    libfontconfig1 libfontconfig1-dev libudev-dev \
    mesa-common-dev libgl1-mesa-dev \
    libasound2-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer-plugins-good1.0-dev \
    libgstreamer-plugins-bad1.0-dev \
    libicu-dev libxslt-dev

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
    wget http://download.qt.io/official_releases/qt/5.12/5.12.0/single/qt-everywhere-src-5.12.0.tar.xz && \
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

# nvidia-container-runtime
## can run OpenGL in Container
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# OpenGL
## This fix: libGL error: No matching fbConfigs or visuals found
ENV LIBGL_ALWAYS_INDIRECT 1
## To fix: QGLXContext: Failed to create dummy context
#ENV QT_QUICK_BACKEND software

# Add group & user + sudo
RUN groupadd -r user && \
    useradd -m -g user -G audio,video user && \
    echo 'user ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/user && \
    chown -R user:user /home/user

USER user
WORKDIR /home/user
ENV HOME /home/user
