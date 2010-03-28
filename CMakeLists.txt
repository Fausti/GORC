project(gorc)

cmake_minimum_required(VERSION 2.6)

include_directories(src)

file(GLOB_RECURSE gorc_SOURCES src/*.cpp)

add_executable(gorc ${gorc_SOURCES})

find_package(SDL REQUIRED)
find_package(SDL_mixer REQUIRED)
find_package(SDL_image REQUIRED)
find_package(SDL_ttf REQUIRED)

target_link_libraries(gorc SDL SDL_ttf)
