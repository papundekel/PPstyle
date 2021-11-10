cmake_minimum_required(VERSION 3.20)

function(PPstyle TARGET_NAME)
    get_target_property(DIR "${TARGET_NAME}" SOURCE_DIR)

    add_custom_target("${TARGET_NAME}-style"
        COMMAND "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../bin/PPstyle.sh" "${DIR}"
        COMMENT "Formatting ${TARGET_NAME}"
        WORKING_DIRECTORY "${CMAKE_CURRENT_FUNCTION_LIST_DIR}"
    )
    add_dependencies("${TARGET_NAME}" "${TARGET_NAME}-style")
endfunction()
