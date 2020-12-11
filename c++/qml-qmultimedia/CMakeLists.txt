cmake_minimum_required(VERSION 3.5.1)

project(qml-template)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSION OFF)

# Find Qt location
# Please change this to your qt5 path
list(APPEND CMAKE_PREFIX_PATH "/usr/local/qt5")

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)
# Instruct CMake to run rcc automatically when needed.
set(CMAKE_AUTORCC ON)

# Find Qt5 libraies
find_package(Qt5 COMPONENTS REQUIRED
    Core Qml Quick Multimedia)

# Source files
FILE(GLOB_RECURSE SOURCE_FILES
    "${CMAKE_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_SOURCE_DIR}/src/*.c"
)

# Qt resources
FILE(GLOB_RECURSE RESOURCES
    "${CMAKE_SOURCE_DIR}/src/*.qrc"
)

add_definitions(-DFLUID_LOCAL)
# Tell CMake to create the xxx executable
add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${RESOURCES})

# Use module from Qt5
target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME}
    Qt5::Core Qt5::Qml Qt5::Quick  Qt5::Multimedia)

install(TARGETS ${PROJECT_NAME} DESTINATION bin)
