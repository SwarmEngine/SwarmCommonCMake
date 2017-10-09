
ExternalProject_Add(GoogleTest
        PREFIX GoogleTest
        GIT_REPOSITORY https://github.com/google/googletest.git
        UPDATE_COMMAND ${GIT_EXECUTABLE} pull
        CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
)

# Test Definition Function
function(SwarmDefineTest Name)
    add_executable(Swarm${Name}Test ${ARGN})
    target_link_libraries(Swarm${Name}Test ${SwarmPackageLibraries} Swarm${Name} gtest)
    add_dependencies(Swarm${Name}Test ${SwarmPackageDependencies} Swarm${Name} GoogleTest)
endfunction(SwarmDefineTest)