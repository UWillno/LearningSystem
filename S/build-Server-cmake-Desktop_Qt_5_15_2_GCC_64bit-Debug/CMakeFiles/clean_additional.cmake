# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/Server-cmake_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/Server-cmake_autogen.dir/ParseCache.txt"
  "Server-cmake_autogen"
  )
endif()
