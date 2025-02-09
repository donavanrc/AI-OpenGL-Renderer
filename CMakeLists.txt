cmake_minimum_required(VERSION 3.10)

# Set the project name
project(AI-OpenGL-Renderer)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Disable unnecessary resources
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)

# Add the executable
add_executable(AI-OpenGL-Renderer src/main.cpp)

# Add dependencies
add_subdirectory(external/glfw)
add_subdirectory(external/glad)

# Include directories
include_directories(external/glfw/include)
include_directories(external/glad/include)
include_directories(external/glm)
include_directories(external/stb)

# Link libraries
target_link_libraries(AI-OpenGL-Renderer glfw glad)
