cmake_minimum_required(VERSION 3.20)

function(PPstyle TARGET_NAME)
    include(GNUInstallDirs)

    set(_install_prefix "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../../")

    get_target_property(_sources "${TARGET_NAME}" SOURCES)
    get_target_property(_interface_sources "${TARGET_NAME}" INTERFACE_SOURCES)

    foreach(_source ${_sources} ${_interface_sources})
        file(REAL_PATH ${_source} _source_absolute)
        list(APPEND _all_sources_args ${_source_absolute})
    endforeach()

    list(REMOVE_DUPLICATES _all_sources_args)

    string(REPLACE ";" " " _all_sources_args "${_all_sources_args}")

    set(_style_target "${TARGET_NAME}-style")

    add_custom_target("${_style_target}"
        COMMAND "${_install_prefix}/${CMAKE_INSTALL_BINDIR}/PPstyle" "${_all_sources_args}"
        COMMENT "Formatting ${TARGET_NAME}"
        WORKING_DIRECTORY "${_install_prefix}/${CMAKE_INSTALL_SHAREDSTATEDIR}/"
    )

    add_dependencies("${TARGET_NAME}" "${_style_target}")
endfunction()
