
# Boost Add Function
function(SwarmAddBoost)
    set(Boost_USE_STATIC_LIBS ON)
    set(Boost_USE_MULTITHREADED ON)
    find_package(Boost COMPONENTS ${ARGV} REQUIRED)
    include_directories(${Boost_INCLUDE_DIRS})
    link_directories(${Boost_LIBRARY_DIRS})

    if(NOT Boost_FOUND)
        message(FATAL " BOOST not found!")
    endif(NOT Boost_FOUND)

    if(WIN32 AND __COMPILER_GNU)
        add_definitions(-DBOOST_THREAD_USE_LIB)
    endif(WIN32 AND __COMPILER_GNU)

    set(SwarmPackageLibraries ${SwarmPackageLibraries} ${Boost_LIBRARIES} PARENT_SCOPE)
endfunction(SwarmAddBoost)