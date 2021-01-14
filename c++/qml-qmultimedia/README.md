# QML/QMultimedia Template

## Require

- Qt5.10+
- CMake & Ninja

## Run with docker (on Ubuntu)

```bash
$ xhost +local:docker
```

```bash
$ docker run --rm -it \
    --gpus all \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix" \
    --volume="$PWD:/home/user/qt-template" \
    --device /dev/snd \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
    --privileged \
    kakalin/qt:5.12.0
```

## Build & Run

```bash
$ chmod +x build.sh

$ ./build.sh
```

```bash
$ cd build
$ ./qmultimedia-template
```

## clean

```bash
$ chmod +x clean.sh

$ ./clean.sh
```

## Trobuleshooting

### Qt is not found

Opening ```CMakeLists.txt``` and uncomment ```list(APPEND CMAKE_PREFIX_PATH ${Your Qt path})``` and modify Qt location
