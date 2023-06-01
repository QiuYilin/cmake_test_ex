cmake_minimum_required(VERSION 3.5.1)
project(test_cmake_find)

find_package(test_cmake REQUIRED COMPONENTS
  component1
  component2
)

include_directories(
  include
  ${test_cmake_INCLUDE_DIRS}
)

add_executable(${PROJECT_NAME}
  src/test_cmake_find.cpp
)

target_link_libraries(${PROJECT_NAME}
  ${test_cmake_LIBRARIES}
)

