cmake_minimum_required(VERSION 3.19)

option(USE_VCPKG "use vcpkg" ON)

# IF (WIN32)
# 	IF(USE_VCPKG)
		set(CMAKE_TOOLCHAIN_FILE "C:/src/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")
# 	ENDIF()
# 	MESSAGE(STATUS "Now is windows")
# ELSEIF (APPLE)
# 	MESSAGE(STATUS "Now is Apple systens.")
# ELSEIF (UNIX)
# 	MESSAGE(STATUS "Now is UNIX-like OS's.")
# ENDIF ()

set(project_name ExeTest)

#temp
IF (WIN32)
  set(CMAKE_INSTALL_PREFIX "C:/SFR")
ELSEIF (UNIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local/SFR")
ENDIF ()
set (SfrUtils_DIR ${CMAKE_INSTALL_PREFIX}/share/SfrUtils CACHE PATH "SfrUtils cmake files directory")
set (SfrQtEx_DIR ${CMAKE_INSTALL_PREFIX}/share/SfrQtEx CACHE PATH "SfrQtEx cmake files directory")
set(INSTALL_CMAKEDIR share/${project_name})

#main


project(${project_name} VERSION 2.0.0 LANGUAGES CXX)

if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release")
endif()

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(BUILD_DEBUG_POSTFIX_D "Append d suffix to debug libraries" ON)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/lib")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/lib")


find_package(QT NAMES Qt6 REQUIRED COMPONENTS Widgets)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Widgets Gui OpenGL Network)
message(STATUS "QT_VERSION: ${QT_VERSION}, QT_DIR: ${QT_DIR}")
find_package(nlohmann_json CONFIG REQUIRED)
find_package(Eigen3 3.4.0 CONFIG REQUIRED)
find_package(SfrUtils 2.0.0 REQUIRED)
find_package(SfrQtEx 2.0.0 REQUIRED)

set(CMAKE_AUTOMOC ON) # Meta-Object Compiler
set(CMAKE_AUTORCC ON) # Resource Compiler
#set(CMAKE_AUTOUIC ON) # User Interface Compiler

if(BUILD_DEBUG_POSTFIX_D)
  set(CMAKE_DEBUG_POSTFIX "d")
  set(CMAKE_RELEASE_POSTFIX "")
  set(CMAKE_RELWITHDEBINFO_POSTFIX "rd")
  set(CMAKE_MINSIZEREL_POSTFIX "s")
endif()

configure_file(${PROJECT_SOURCE_DIR}/cmake/${project_name}Config.cmake.in
  ${CMAKE_BINARY_DIR}/${project_name}Config.cmake
  @ONLY
)

include(CMakePackageConfigHelpers)

write_basic_package_version_file( "${CMAKE_CURRENT_BINARY_DIR}/${project_name}ConfigVersion.cmake" 
  COMPATIBILITY SameMajorVersion 
  )

# install(FILES
#   ${CMAKE_BINARY_DIR}/${project_name}Config.cmake
#   ${CMAKE_BINARY_DIR}/${project_name}ConfigVersion.cmake
#   DESTINATION ${INSTALL_CMAKEDIR}
# )

add_subdirectory(src)

include(${CMAKE_CURRENT_LIST_DIR}/cmake/CMakeCPack.cmake)