register_fprime_config(
    SOURCES
        "${CMAKE_CURRENT_LIST_DIR}/ComFpySubtopologyConfig.cpp"
    HEADERS
        "${CMAKE_CURRENT_LIST_DIR}/ComFpySubtopologyConfig.hpp"
    AUTOCODER_INPUTS
        "${CMAKE_CURRENT_LIST_DIR}/ComFpyConfig.fpp"
        "${CMAKE_CURRENT_LIST_DIR}/ComFpyComDriverConfig.fpp"
    DEPENDS
        Fw_Types
)
