add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/ComFpyConfig/")

register_fprime_module(
    AUTOCODER_INPUTS
        "${CMAKE_CURRENT_LIST_DIR}/ComFpy.fpp"
    HEADERS
        "${CMAKE_CURRENT_LIST_DIR}/SubtopologyTopologyDefs.hpp"
        "${CMAKE_CURRENT_LIST_DIR}/PingEntries.hpp"
    DEPENDS
        FpyDemo_ComFpy_ComFpyConfig
    INTERFACE
)
