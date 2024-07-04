#!/bin/bash

XSOCK=/tmp/.X11-unix
# change the XAUTH to your own .Xauthority file
XAUTH=/root/.Xauthority

DOCKER_REPO=kakalin/
BRAND=qt
VERSION=5.15.10
IMAGE_NAME=${DOCKER_REPO}${BRAND}:${VERSION}

# https://stackoverflow.com/questions/3162385/how-to-split-a-string-in-shell-and-get-the-last-field
PROJECT_FOLDER=${PWD##*/}

GPU_DEVICE=""
if [[ -z $1 ]]; then
    GPU_DEVICE="all"
else
    GPU_DEVICE="device=$1"
fi

# -e QT_X11_NO_MITSHM=1: Disables MIT-SHM extension for Qt applications.
# -e XAUTHORITY=$XAUTH: Sets the XAUTHORITY environment variable to the .Xauthority file.
# -v $XSOCK:$XSOCK: Mounts the X11 socket to the container.
# -v $HOME/.Xauthority:$XAUTH: Mounts the .Xauthority file to the container.
# --network=host: Shares the host network with the container.
# --privileged: Enables privileged mode for the container.s
docker_run_params=$(cat <<-END
    --rm -it \
    -e QT_X11_NO_MITSHM=1 \
    -e XAUTHORITY=$XAUTH \
    -v $XSOCK:$XSOCK \
    -v $HOME/.Xauthority:$XAUTH \
    --network=host \
    -v $PWD:/root/$PROJECT_FOLDER \
    -w /root/$PROJECT_FOLDER \
    --privileged \
    $IMAGE_NAME
END
)

# xhost 開放權限
## on Local machine
xhost +localhost # for macOS
xhost +local:docker # for Linux
## on Remote machine
# xhost + # or xhost +<specific ip>
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    GPU=$(lspci | grep -i '.* vga .* nvidia .*')
    if [[ $GPU == *' NVIDIA '* ]]; then
        # -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native: Sets the PulseAudio server environment variable.
        # -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native: Mounts the PulseAudio socket to the container.
        # -v $PWD:/home/user/$PROJECT_FOLDER: Mounts the current directory to the container.
        docker run \
            --gpus $GPU_DEVICE \
            -e DISPLAY=$DISPLAY \
            -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
            -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
            -v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
            $docker_run_params
    else
        docker run \
            -e QT_QUICK_BACKEND=software \
            -e DISPLAY=$DISPLAY \
            -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
            -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
            -v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
            $docker_run_params
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    docker run \
        -e DISPLAY=host.docker.internal:0 \
        -e QT_QUICK_BACKEND=software \
        $docker_run_params
else
    echo "Haven't supported this OS Type, please check command\n and update it."
fi
