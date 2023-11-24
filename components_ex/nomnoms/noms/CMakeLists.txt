cmake_minimum_required(VERSION 3.0)
set(project noms)


project(${project})

set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

add_subdirectory(fruit)
add_subdirectory(veg)
add_subdirectory(example)

# UPDATE: implement advice from Tsyvarev

configure_file(${project}-config.cmake
  "${CMAKE_BINARY_DIR}/${project}-config.cmake"
  @ONLY
)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  "${CMAKE_BINARY_DIR}/${project}-config-version.cmake"
  VERSION "0.0.0"
  COMPATIBILITY AnyNewerVersion
)

install(
  FILES
    "${CMAKE_BINARY_DIR}/${project}-config.cmake"
  DESTINATION lib/cmake/${project}
)
