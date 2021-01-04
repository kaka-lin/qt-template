# Qt/QML Container Image

## Download image form Docker Hub

```bash
$ docker pull kakalin/qt:5.12.0
```

## Build the image (Optional)

```bash
$ docker build --rm -t kakalin/qt:5.12.0 .
```

### Push to Docker Hub

```bash
$ docker login
$ docker push kakalin/qt:5.12.0
```

## Run

### 1. Run it on `Ubuntu`

```bash
# Expose the X server on the host
$ xhost +local:docker
```

#### Note:

```
Notice current path, if you use `$PWD`,
you should in the root path of the  project,
```
---

- GPU

    ```bash
    $ docker run --rm -it \
        --gpus all \
        -e DISPLAY=$DISPLAY \
        -e QT_X11_NO_MITSHM=1 \
        --volume="/tmp:/tmp" \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --volume="$PWD:/home/user/qt-template" \
        --privileged \
        kakalin/qt:5.12.0
    ```

- CPU

    ```bash
    $ docker run --rm -it \
        -e DISPLAY=$DISPLAY \
        -e QT_X11_NO_MITSHM=1 \
        --volume="/tmp:/tmp" \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --volume="$PWD:/home/user/qt-template" \
        --privileged \
        kakalin/qt:5.12.0
    ```

### 2. Run it on `macOS`

Reference: [X11 in docker on macOS](https://gist.github.com/cschiewek/246a244ba23da8b9f0e7b11a68bf3285)

1. Install [XQuartz](https://dl.bintray.com/xquartz/downloads/XQuartz-2.7.11.dmg) from official website or through [Homebrew](https://brew.sh/)

    ```bash
    $ brew install --cask xquartz
    ```

    and then `Restart OS`.

2. Open XQuartz and Check the option: `XQuartz -> Preferences -> Security -> "Allow connections from network clients"`

    ```bash
    # open XQuartz
    $ open -a XQuartz
    ```

3. In terminal:

    ```bash
    # Expose the X server on the host
    $ xhost +local:docker
    ```

    ```bash
    docker run --rm -it \
        -e DISPLAY=host.docker.internal:0 \
        -e QT_X11_NO_MITSHM=1 \
        --volume="/tmp:/tmp" \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --volume="$PWD:/home/user/qt-template" \
        --privileged \
        kakalin/qt:5.12.0
    ```

## Troubleshooting

1. `libGL error: No matching fbConfigs or visuals found`

    ```bash
    $ export LIBGL_ALWAYS_INDIRECT=1
    ```

2. `QGLXContext: Failed to create dummy context`

    Workaround:

    ```bash
    $ export QT_QUICK_BACKEND=software
    ```
