cmake_minimum_required(VERSION 3.10)

# set the project name
project(cmake_example VERSION 11.1)

configure_file(version_def.h.in ${CMAKE_CURRENT_SOURCE_DIR}/version_def.h)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_MAKE_PROGRAM, ninja)

# add the executable
add_executable(cmake_example cmake_example.cpp)

target_include_directories(cmake_example PUBLIC /home/briq/studio/cmake_example)

