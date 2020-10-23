cmake_minimum_required(VERSION 3.10) # minimal version required

# add the executable
add_library(lib1 lib1.cpp)

target_include_directories(lib1 PUBLIC .)

