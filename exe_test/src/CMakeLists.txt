file(GLOB_RECURSE CPPS  ./*.cpp )
file(GLOB_RECURSE HS  ./*.h )
set(UI_FILES
	./SfrTableWidgetDemo.ui
)

if (${QT_VERSION_MAJOR} EQUAL 6)
  qt_wrap_ui(demo_uic_files
      ${UI_FILES}
  )
else()
  qt5_wrap_ui(demo_uic_files
  ${UI_FILES}
  )
endif()

find_package(SfrUtils REQUIRED)
find_package(SfrQtEx  REQUIRED COMPONENTS Widgets)

add_executable(ExeTest ${CPPS} ${HS} ${demo_uic_files})

target_include_directories(ExeTest
  PUBLIC
    $<BUILD_INTERFACE:  ${CMAKE_CURRENT_SOURCE_DIR}>
    $<BUILD_INTERFACE:  ${CMAKE_CURRENT_BINARY_DIR}>
	#UIC location
)

target_link_libraries(ExeTest PRIVATE SfrQtEx::Widgets)

IF (WIN32)
  if(USE_VCPKG)
       set(TOOL_WINDEPLOYQT "windeployqt")

       add_custom_command(TARGET ExeTest POST_BUILD
       COMMAND ${TOOL_WINDEPLOYQT}$<$<CONFIG:Debug,RelWithDebInfo>:.debug.bat>
               $<TARGET_FILE:ExeTest>
       COMMENT "Running windeployqt... "
  )
  endif()
ENDIF ()

install(TARGETS ExeTest
  EXPORT ExeTestTargets
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}/${project_name}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/${project_name}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/${project_name}
  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${project_name}/${component}
)