#!/bin/bash

IMAGE_NAME="kakalin/qt:5.12.0"
docker_run_params=$(cat <<-END
    --rm \
    -it \
    -e QT_X11_NO_MITSHM=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $PWD:/home/user/qt-template \
    -w /home/user/qt-template \
    $IMAGE_NAME
END
)

xhost +localhost
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    GPU=$(lspci | grep -i '.* vga .* nvidia .*')
    if [[ $GPU == *' NVIDIA '* ]]; then
        # printf 'Nvidia GPU is present:  %s\n' "$GPU"
        docker run \
            --gpus all \
            -e DISPLAY=$DISPLAY \
            $docker_run_params
    else
        docker run \
            -e DISPLAY=$DISPLAY \
            $docker_run_params
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    docker run \
        -e DISPLAY="host.docker.internal:0" \
        -e QT_QUICK_BACKEND=software \
        $docker_run_params
    exec "$@"
else
    echo "Haven't supported this OS Type, please check command\n and update it."
fi
