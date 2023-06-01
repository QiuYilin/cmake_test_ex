set(PROJECT_VERSION 1.0.0)

#===============================================================================
# Macros for Package generation
#
#  PROJECT_GENERATE_PACKAGE - Generates *Config.cmake
#    Usage: PROJECT_GENERATE_PACKAGE(target_name)
#      INPUT:
#           target_name             the name of the target. e.g. component1
#    Example: PROJECT_GENERATE_PACKAGE(Foundation)

macro(PROJECT_GENERATE_PACKAGE target_name)
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
	"${CMAKE_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}-${target_name}ConfigVersion.cmake"
	VERSION ${PROJECT_VERSION}
	COMPATIBILITY AnyNewerVersion
)
if("${CMAKE_VERSION}" VERSION_LESS "3.0.0")
	if(NOT EXISTS "${CMAKE_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}-${target_name}Targets.cmake")
		export(TARGETS "${target_name}" APPEND
			FILE "${CMAKE_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}-${target_name}Targets.cmake"
			NAMESPACE "${PROJECT_NAME}::"
    	)
    endif()
else()
	export(EXPORT "${target_name}Targets"
		FILE "${CMAKE_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}-${target_name}Targets.cmake"
		NAMESPACE "${PROJECT_NAME}::"
    )
endif()
configure_file("cmake/${PROJECT_NAME}-${target_name}Config.cmake"
	"${CMAKE_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}-${target_name}Config.cmake"
	@ONLY
)

# Set config script install location in a location that find_package() will
# look for, which is different on MS Windows than for UNIX
# Note: also set in root CMakeLists.txt
if(WIN32)
	set(projectConfigPackageLocation "cmake")
else()
	set(projectConfigPackageLocation "lib${LIB_SUFFIX}/cmake/${PROJECT_NAME}")
endif()

install(
    EXPORT "${target_name}Targets"
    FILE "${PROJECT_NAME}-${target_name}Targets.cmake"
    NAMESPACE "${PROJECT_NAME}::"
    DESTINATION "${projectConfigPackageLocation}"
)

install(
    FILES
        "${CMAKE_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}-${target_name}Config.cmake"
        "${CMAKE_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}-${target_name}ConfigVersion.cmake"
    DESTINATION "${projectConfigPackageLocation}"
    COMPONENT Devel
)

endmacro()

#===============================================================================
# Macros for simplified installation
#
#  PROJECT_INSTALL_COMPONENT - Install the given target
#    Usage: PROJECT_INSTALL_COMPONENT(target_name)
#      INPUT:
#           target_name             the name of the target. e.g. component1
#    Example: PROJECT_INSTALL_COMPONENT(component1)
macro(PROJECT_INSTALL_COMPONENT target_name )

install(
    DIRECTORY include/
    DESTINATION include/${PROJECT_NAME}
    COMPONENT Devel
    PATTERN ".svn" EXCLUDE
)

install(
    TARGETS "${target_name}" EXPORT "${target_name}Targets"
    LIBRARY DESTINATION lib${LIB_SUFFIX}/${PROJECT_NAME}
    ARCHIVE DESTINATION lib${LIB_SUFFIX}/${PROJECT_NAME}
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include
)

if(MSVC)
# install the targets pdb
	PROJECT_INSTALL_PDB(${target_name})
endif()

endmacro()

