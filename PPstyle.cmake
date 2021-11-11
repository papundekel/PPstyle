cmake_minimum_required(VERSION 3.20)

set(_install_prefix "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../../")

function(PPstyle TARGET_NAME)
    get_target_property(_sources "${TARGET_NAME}" SOURCES)
    get_target_property(_interface_sources "${TARGET_NAME}" INTERFACE_SOURCES)
    list(APPEND _all_sources _sources ${_interface_sources})
    list(REMOVE_DUPLICATES _all_sources)

    add_custom_target("${TARGET_NAME}-style"
        COMMAND "${_install_prefix}/bin/PPstyle.sh" ${_all_sources}
        COMMENT "Formatting ${TARGET_NAME}"
        WORKING_DIRECTORY "${_install_prefix}"
    )
    add_dependencies("${TARGET_NAME}" "${TARGET_NAME}-style")
endfunction()
