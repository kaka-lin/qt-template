# QML Template

## Require

- Qt5.10+
- CMake & Ninja

## build

```bash
$ mkdir -p build && cd build

$ cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug ..

$ cmake --build .
```

## Trobuleshooting

### Qt is not found

Opening ```CMakeLists.txt``` and uncomment ```list(APPEND CMAKE_PREFIX_PATH ${Your Qt path})``` and modify Qt location
