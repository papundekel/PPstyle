cmake_minimum_required(VERSION 3.20)

function(init)
    set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_CURRENT_LIST_DIR}/vendor/${CMAKE_INSTALL_DATADIR}/cmake" PARENT_SCOPE)
endfunction()

function(download_package URL)
    cmake_path(GET URL FILENAME _filename)

    file(DOWNLOAD "${URL}" "${_filename}")
    file(ARCHIVE_EXTRACT INPUT "${_filename}" DESTINATION "${CMAKE_CURRENT_LIST_DIR}/vendor")
    file(REMOVE "${_filename}")
endfunction()

project(PPstyle VERSION "1.0.12")
include(GNUInstallDirs)

init()

install(FILES "PPstyle.cmake" DESTINATION "${CMAKE_INSTALL_DATADIR}/cmake/")
install(FILES "PPstyle.format" DESTINATION "${CMAKE_INSTALL_SHAREDSTATEDIR}")

set(CPACK_GENERATOR "TGZ")
include(CPack)
