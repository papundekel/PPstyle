cmake_minimum_required(VERSION 3.20)

project(PPstyle VERSION "1.0.13")

file(DOWNLOAD "https://raw.githubusercontent.com/Petkr/PPcmake/main/PPcmake.cmake" "${CMAKE_BINARY_DIR}/PPcmake.cmake")
include("${CMAKE_BINARY_DIR}/PPcmake.cmake")

PPcmake_package("github.com" "Petkr" "PPcmake" "1.0.2")
include(PPcmake)

PPcmake_install_file("${PPCMAKE_MODULE_PATH}/PPcmake.cmake")
PPcmake_install_file("PPstyle.cmake")
PPcmake_install_file("PPstyle.format")

PPcmake_cpack()
