INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_DETECTOR detector)

FIND_PATH(
    DETECTOR_INCLUDE_DIRS
    NAMES detector/api.h
    HINTS $ENV{DETECTOR_DIR}/include
        ${PC_DETECTOR_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    DETECTOR_LIBRARIES
    NAMES gnuradio-detector
    HINTS $ENV{DETECTOR_DIR}/lib
        ${PC_DETECTOR_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(DETECTOR DEFAULT_MSG DETECTOR_LIBRARIES DETECTOR_INCLUDE_DIRS)
MARK_AS_ADVANCED(DETECTOR_LIBRARIES DETECTOR_INCLUDE_DIRS)

