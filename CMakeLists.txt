cmake_minimum_required(VERSION 3.10) # minimal version required

option(USE_LIB1 "Use tutorial provided lib1 implementation" ON)

# set the project name
project(cmake_example VERSION 11.1)

# specify the auto generate file version_def.h
configure_file(version_def.h.in ${CMAKE_CURRENT_SOURCE_DIR}/version_def.h)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# set the build system 
set(CMAKE_MAKE_PROGRAM, ninja)

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

