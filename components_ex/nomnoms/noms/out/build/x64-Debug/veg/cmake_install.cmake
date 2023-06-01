# Install script for directory: C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/veg

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/out/install/x64-Debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "veg" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/out/build/x64-Debug/veg/veg.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "veg" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/out/build/x64-Debug/veg/veg.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "veg" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/noms/noms-veg-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/noms/noms-veg-targets.cmake"
         "C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/out/build/x64-Debug/veg/CMakeFiles/Export/36e67f2eff6dd87cc0f1354ef5d513bf/noms-veg-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/noms/noms-veg-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/noms/noms-veg-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/noms" TYPE FILE FILES "C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/out/build/x64-Debug/veg/CMakeFiles/Export/36e67f2eff6dd87cc0f1354ef5d513bf/noms-veg-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/noms" TYPE FILE FILES "C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/out/build/x64-Debug/veg/CMakeFiles/Export/36e67f2eff6dd87cc0f1354ef5d513bf/noms-veg-targets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "veg" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/noms" TYPE FILE FILES
    "C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/out/build/x64-Debug/noms-veg-config.cmake"
    "C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/out/build/x64-Debug/noms-veg-config-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "veg" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/out/install/x64-Debug/include")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/out/install/x64-Debug" TYPE DIRECTORY FILES "C:/program_on_git/bookcode/Modern-CMake-for-Cpp/examples/chapter11/components_ex/nomnoms/noms/veg/include")
endif()

