cmake_minimum_required(VERSION 3.1)

project(qt_template)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSION OFF)

# Find Qt location
# Please change this to your qt5 path
list(APPEND CMAKE_PREFIX_PATH "/usr/local/opt/qt5")

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)
# Instruct CMake to run rcc automatically when needed.
set(CMAKE_AUTORCC ON)

# Find Qt5 libraies
find_package(Qt5 REQUIRED COMPONENTS
    Core Gui Widgets)

# Source files
FILE(GLOB_RECURSE SOURCE_FILES
    "${CMAKE_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_SOURCE_DIR}/src/*.c"
)

add_definitions(-DFLUID_LOCAL)
# Tell CMake to create the xxx executable
add_executable(${PROJECT_NAME} ${SOURCE_FILES})

# Use module from Qt5
target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt5::Core Qt5::Widgets)

install(TARGETS ${PROJECT_NAME} DESTINATION bin)
