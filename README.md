# Qt Template/Example

This is `template/example` that can rapid to build ```Qt/QML``` application.

You can just copy you prefer program language's folder and start to code and build and run.

Applications that build with this `Qt Template`: [Examples](#examples)

## Usage

1. Clone this repo
```bash
$ git clone https://github.com/kaka-lin/qt-template.git
```

2. Choosing you prefer program language, ex: ```c++```

```bash
$ cp -r c++/qml <Your path>
```

3. Buinding application

    Follow the steps of each folder's ```README```

## Run with Docker (Optional)

### 1. Build Qt Container Image

```bash
$ docker build --rm -t kakalin/qt:5.12.0 .
```

### 2. Run with Qt Container Image

```bash
# Expose the X server on the host
$ xhost +local:docker
```

```bash
$ docker run --rm -it \
    --gpus all \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --device /dev/dri \
    --device /dev/snd \
    --volume="/tmp:/tmp" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$PWD:/home/user/qt-template" \
    --privileged \
    kakalin/qt:5.12.0
```

## Examples

Applications that build with `Qt`, you can reference projects as below,

- PyQt5

    - [serialport-gui](https://github.com/kaka-lin/serialport-gui)

        UART and ModBus

    - [pyqt-image-recognition](https://github.com/kaka-lin/pyqt-image-recognition)

        Handwriting recognition

    - [cvs-ptool](https://github.com/kaka-lin/csv-ptool)

        Embedding `Matplotlib` in Qt

    - [audio-tools](https://github.com/kaka-lin/audio-tools)

        Embedding `Matplotlib` in Qt

- PyQt5/QML

    - [pytest-gui](https://github.com/kaka-lin/pytest-gui)

        Can see the result of unittest on GUI immediately.

    - [canbus-tool](https://github.com/kaka-lin/canbus-tool)

        Can dump canbus information
