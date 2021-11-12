cmake_minimum_required(VERSION 3.20)

function(PPstyle TARGET_NAME)
    include(GNUInstallDirs)

    set(_install_prefix "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../../")

    get_target_property(_source_dir "${TARGET_NAME}" SOURCE_DIR)
    get_target_property(_sources "${TARGET_NAME}" SOURCES)
    get_target_property(_interface_sources "${TARGET_NAME}" INTERFACE_SOURCES)

    foreach(_source ${_sources} ${_interface_sources})
        cmake_path(ABSOLUTE_PATH _source BASE_DIRECTORY "${_source_dir}" OUTPUT_VARIABLE _source)
        list(APPEND _all_sources ${_source})
    endforeach()

    list(REMOVE_DUPLICATES _all_sources)

    set(_style_target "${TARGET_NAME}-style")

    add_custom_target("${_style_target}"
        COMMAND "${_install_prefix}/${CMAKE_INSTALL_BINDIR}/PPstyle" "${_all_sources}"
        COMMENT "Formatting ${TARGET_NAME}"
        WORKING_DIRECTORY "${_install_prefix}/${CMAKE_INSTALL_SHAREDSTATEDIR}/"
        COMMAND_EXPAND_LISTS
    )

    add_dependencies("${TARGET_NAME}" "${_style_target}")
endfunction()
