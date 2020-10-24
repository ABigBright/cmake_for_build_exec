cmake_minimum_required(VERSION 3.10) # minimal version required

option(USE_LIB1 "Use tutorial provided lib1 implementation" ON)

# crosscompile config
set(CMAKE_SYSTEM_PROCESSOR arm)
set(tools /home/briq/win/e/toolchain/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf)
set(CMAKE_C_COMPILER ${tools}/bin/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER ${tools}/bin/arm-linux-gnueabihf-g++)

# set the project name
project(cmake_example VERSION 11.1)

# specify the auto generate file version_def.h
configure_file(version_def.h.in ${CMAKE_CURRENT_SOURCE_DIR}/version_def.h)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# add the executable
add_executable(cmake_example cmake_example.cpp)

if (USE_LIB1)
    set(EXTRA_LIBS)
    set(EXTRA_INCLUDE)
    
    list(APPEND EXTRA_LIBS lib1)
    list(APPEND EXTRA_INCLUDE ${PROJECT_BINARY_DIR}/lib1)
    
    add_subdirectory(${EXTRA_LIBS})
    target_link_libraries(cmake_example ${EXTRA_LIBS})
endif()

# add the .h search path when compile target file
target_include_directories(cmake_example PUBLIC 
    /home/briq/studio/cmake_example
    ${EXTRA_INCLUDE}
)
