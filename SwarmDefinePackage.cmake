
# Package Definition Function
function(SwarmDefinePackage Name Version)

    # Split Version String
    string(REPLACE "." ";" VersionList ${Version})
    list(LENGTH VersionList VersionCount)
    if(${VersionCount} LESS 2)
        message(FATAL "At minimum, a Major and Minor version must be specified for Swarm packages, in the format Major.Minor.[Patch].[Extra]")
    endif()

    # Determine Version Variables
    list(GET VersionList 0 Major)
    list(GET VersionList 1 Minor)
    if(${VersionCount} LESS 3)
        set(Patch 0)
    else()
        list(GET VersionList 2 Patch)
    endif()
    if(${VersionCount} LESS 4)
        set(Extra "")
    else()
        list(GET VersionList 3 Extra)
    endif()

    # Set Swarm Version Variables
    set(Swarm${Name}_VERSION_MAJOR ${Major} PARENT_SCOPE)
    set(Swarm${Name}_VERSION_MINOR ${Minor} PARENT_SCOPE)
    set(Swarm${Name}_VERSION_PATCH ${Patch} PARENT_SCOPE)
    set(Swarm${Name}_VERSION_EXTRA ${Extra} PARENT_SCOPE)
    set(Swarm${Name}_VERSION "${Major}.${Minor}" PARENT_SCOPE)
    set(FullVersionTemp "${Major}.${Minor}.${Patch}${Extra}")
    set(Swarm${Name}_VERSION_FULL ${FullVersionTemp} PARENT_SCOPE)
    message(STATUS "Swarm${Name} Package Version: ${FullVersionTemp}")

    # Define Package
    add_library(Swarm${Name} ${ENGINE_BUILD_TYPE} ${ARGN})
    target_link_libraries(Swarm${Name} ${SwarmPackageLibraries})
    add_dependencies(Swarm${Name} ${SwarmPackageDependencies})

endfunction(SwarmDefinePackage)
