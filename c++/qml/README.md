# QML Template

## Require

- Qt5.10+
- CMake & Ninja

## build

### Method 1

```bash
$ mkdir -p build && cd build
$ cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug ..
$ cmake --build .
```

### Method 2

```bash
$ chmod +x build.sh

$ ./build.sh
```

## clean

```bash
$ chmod +x clean.sh

$ ./clean.sh
```

## Trobuleshooting

### Qt is not found

Opening ```CMakeLists.txt``` and uncomment ```list(APPEND CMAKE_PREFIX_PATH ${Your Qt path})``` and modify Qt location
