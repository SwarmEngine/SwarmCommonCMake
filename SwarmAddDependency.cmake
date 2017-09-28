
# Swarm Package Add Function
function(SwarmAddPackageDependency Name)
    ExternalProject_Add("Swarm${Name}"
            PREFIX "Swarm${Name}"
            GIT_REPOSITORY "https://github.com/SwarmEngine/Swarm${Name}"
            UPDATE_COMMAND ${GIT_EXECUTABLE} pull
            CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${ENGINE_INSTALL_LOCATION}
    )
    find_library(FoundLib Swarm${Name})
    if(FoundLib)
        set(SwarmPackageLibraries ${SwarmPackageLibraries} ${FoundLib} PARENT_SCOPE)
    endif(FoundLib)
    set(SwarmPackageDependencies ${SwarmPackageDependencies} Swarm${Name} PARENT_SCOPE)
endfunction(SwarmAddPackageDependency)

# External Dependency Add Function
function(SwarmAddExternalDependency Name GitRepository)
    ExternalProject_Add(${Name}
            PREFIX ${Name}
            GIT_REPOSITORY ${GitRepository}
            UPDATE_COMMAND ${GIT_EXECUTABLE} pull
            CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    )
    find_library(FoundLib ${Name})
    if(FoundLib)
        set(SwarmPackageLibraries ${SwarmPackageLibraries} ${FoundLib} PARENT_SCOPE)
    endif(FoundLib)
    set(SwarmPackageDependencies ${SwarmPackageDependencies} ${Name} PARENT_SCOPE)
endfunction(SwarmAddExternalDependency)