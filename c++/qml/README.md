# QML Template

## Require

- CMake & Ninja
- Qt5.10+

## build

```bash
$ mkdir build & cd build

$ cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug ..

$ cmake --build .
```

## Trobuleshooting

### Qt is not found

Opening ```CMakeLists.txt``` and uncomment ```list(APPEND CMAKE_PREFIX_PATH ${Your Qt path})``` and modify Qt location
