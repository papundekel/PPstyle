cmake_minimum_required(VERSION 3.20)

project(PPstyle VERSION "1.0.0")

set(CPACK_GENERATOR "TGZ")

include(CPack)

install(FILES "PPstyle.sh" DESTINATION "bin/")
install(FILES "PPstyle.cmake" DESTINATION "cmake/")
