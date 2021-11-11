cmake_minimum_required(VERSION 3.20)

project(PPstyle VERSION "1.0.4")

set(CPACK_GENERATOR "TGZ")
include(CPack)

include(GNUInstallDirs)

install(FILES "PPstyle.sh" DESTINATION "${CMAKE_INSTALL_BINDIR}")
install(FILES "PPstyle.cmake" DESTINATION "${CMAKE_INSTALL_DATADIR}/cmake/")
install(FILES "PPstyle.format" DESTINATION "${CMAKE_INSTALL_SHAREDSTATEDIR}")
