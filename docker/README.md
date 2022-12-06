# Qt/QML Container Image

- Qt/QML: 5.12.0
    - Support PyQt5

## Build the image (Optional)

```bash
# $ docker build --rm -t kakalin/qt:5.12.0 .
$ ./build.sh
```

### Push to Docker Hub

```bash
$ docker login
# $ docker push kakalin/qt:5.12.0
$ ./deploy.sh
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
        --volume="/tmp/.X11-unix:/tmp/.X11-unix" \
        --volume="$PWD:/home/user/qt-template" \
        --privileged \
        kakalin/qt:5.12.0
    ```

- CPU

    ```bash
    $ docker run --rm -it \
        -e DISPLAY=$DISPLAY \
        -e QT_X11_NO_MITSHM=1 \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix" \
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
    $ xhost +localhost
    ```

    Creating a bridge between a network socket with a TCP listener on port `6000` (the default port of the X window system) and the X window server on my OS X host.

    ```
    $ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
    ```

    ```bash
    $ docker run --rm -it \
        -e DISPLAY=host.docker.internal:0 \
        -e QT_X11_NO_MITSHM=1 \
        -e QT_QUICK_BACKEND=software \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --volume="$PWD:/home/user/qt-template" \
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

3. Miniconda install issue:
    - Install Python3.8, `ModuleNotFoundError: No module named 'conda.cli.main_info'`

        ```
        comment `conda update -n base conda`
        ```

    2022/12/6 update:  If the old command has error, we can replace it as below:

    ```dockerfile
    # Install miniconda for python 3.8
    ENV PYTHON_VERSION="3.8"
    ENV CONDA_PATH="/usr/local/anaconda3"
    ENV MINICONDA_FILE="Miniconda3-py38_4.12.0-Linux-x86_64.sh"
    RUN wget https://repo.continuum.io/miniconda/${MINICONDA_FILE} && \
        sh ${MINICONDA_FILE} -b -p ${CONDA_PATH} && \
        ${CONDA_PATH}/bin/conda update -n base conda && \
        ${CONDA_PATH}/bin/conda install python=${PYTHON_VERSION} && \
        ${CONDA_PATH}/bin/conda clean -y -a && \
        rm -rf ${MINICONDA_FILE} && \
        rm -rf /temp/*
    ```
