cmake_minimum_required(VERSION 3.5.1)
set(PROJECT_NAME test_cmake)
set(PROJECT_VERSION 1.0.0)

project(${PROJECT_NAME})

# global definations
## for debug
SET(CMAKE_BUILD_TYPE "Debug")  
SET(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g2 -ggdb")  
SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")  

add_definitions(-std=c++11)

set(SHARED_LIBRARY_VERSION 1)

# global environments
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(test_cmakeMacros)

# find all subdirectories
MACRO(SUBDIRLIST result curdir)
  file(GLOB children RELATIVE ${curdir} ${curdir}/*)
  set(dirlist "")
  FOREACH(child ${children})
    IF(IS_DIRECTORY ${curdir}/${child})
      list(APPEND dirlist ${child})
    ENDIF()
  ENDFOREACH()
  set(${result} ${dirlist})
ENDMACRO()

set(project_COMPONENTS "")
FUNCTION(ADDSUBDIR curdir)
  SUBDIRLIST(SUBDIRS ${curdir})
  FOREACH(subdir ${SUBDIRS})
    IF(EXISTS ${curdir}/${subdir}/CMakeLists.txt)
      message("add_subdirectory:${curdir}/${subdir}")
      add_subdirectory(${curdir}/${subdir})
      list(APPEND project_COMPONENTS ${subdir})
    ELSE()
      ADDSUBDIR(${curdir}/${subdir})
    ENDIF()
  ENDFOREACH()
ENDFUNCTION()

ADDSUBDIR(${CMAKE_SOURCE_DIR})

# uninstall
configure_file(
	"${CMAKE_CURRENT_SOURCE_DIR}/cmake/cmake_uninstall.cmake.in"
	"${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
	IMMEDIATE @ONLY)

add_custom_target(uninstall
	"${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
)

# version
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
	"${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}ConfigVersion.cmake"
	VERSION ${PROJECT_VERSION}
	COMPATIBILITY AnyNewerVersion
)

# install cmake file
set(projectConfigPackageLocation "lib${LIB_SUFFIX}/cmake/${PROJECT_NAME}")
configure_file(cmake/${PROJECT_NAME}Config.cmake.in "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}Config.cmake" @ONLY)
install(
	FILES
		${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}Config.cmake
		${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}ConfigVersion.cmake
	DESTINATION
		"${projectConfigPackageLocation}"
	COMPONENT
		Devel
)

# out message
foreach(component ${project_COMPONENTS})
	message(STATUS "Building: ${component}")
endforeach()
