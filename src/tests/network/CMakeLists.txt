cmake_minimum_required(VERSION 3.0.0)
project(mp_network_test VERSION 0.1.0)

include(CTest)
enable_testing()

set(Boost_USE_STATIC_LIBS OFF) 
set(Boost_USE_MULTITHREADED ON)  
set(Boost_USE_STATIC_RUNTIME OFF) 
find_package(Boost 1.71.0 COMPONENTS asio thread chrono date_time) 

include_directories(${Boost_INCLUDE_DIRS}) 

SET (SRCS ../../tools/mp_network.h
../../tools/mp_network.cpp
mp_network_test.cpp
)

add_executable(mp_network_test ${SRCS})

target_link_libraries(mp_network_test pthread ${Boost_LIBRARIES})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
