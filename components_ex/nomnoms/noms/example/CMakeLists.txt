file(GLOB_RECURSE CPPS  ./*.cpp )

set(example_name Demo)

add_executable(${example_name} ${CPPS})

target_include_directories(${example_name}
  PUBLIC
    $<BUILD_INTERFACE:  ${CMAKE_CURRENT_SOURCE_DIR}>
    $<BUILD_INTERFACE:  ${CMAKE_CURRENT_BINARY_DIR}>
	#UIC location
)

target_link_libraries(${example_name} PRIVATE noms::veg)

find_package(VTK REQUIRED)

enable_language(C)

target_link_libraries(${example_name} PRIVATE ${VTK_LIBRARIES})

