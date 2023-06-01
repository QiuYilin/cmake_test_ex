include(CMakeFindDependencyMacro)
find_dependency(test_cmake-component1)
include("${CMAKE_CURRENT_LIST_DIR}/test_cmake-component2Targets.cmake")

