cmake_minimum_required(VERSION 3.20)

include(GNUInstallDirs)
include(PPcmake)

function(PPstyle TARGET_NAME)
    set(_install_prefix "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../../")

    get_target_property(_source_dir "${TARGET_NAME}" SOURCE_DIR)
    get_target_property(_sources "${TARGET_NAME}" SOURCES)
    get_target_property(_interface_sources "${TARGET_NAME}" INTERFACE_SOURCES)

    PPcmake_reset_notfound_var(_sources)
    PPcmake_reset_notfound_var(_interface_sources)

    foreach(_source ${_sources} ${_interface_sources})
        cmake_path(ABSOLUTE_PATH _source BASE_DIRECTORY "${_source_dir}" OUTPUT_VARIABLE _source)
        list(APPEND _all_sources ${_source})
    endforeach()

    list(REMOVE_DUPLICATES _all_sources)

    set(_style_target "${TARGET_NAME}-style")

    file(READ "${_install_prefix}/${CMAKE_INSTALL_SHAREDSTATEDIR}/PPstyle.format" _style)
    string(REGEX REPLACE "((\n  [^\n]*)+)" "{\\1}" _style "${_style}")
    string(REPLACE "{\n" " {" _style "${_style}")
    string(REPLACE "\n" "," _style "${_style}")

    add_custom_target("${_style_target}"
        COMMAND clang-format --style={${_style}} -i ${_all_sources}
        COMMENT "Formatting ${TARGET_NAME}"
        VERBATIM
        COMMAND_EXPAND_LISTS
    )

    add_dependencies("${TARGET_NAME}" "${_style_target}")
endfunction()
