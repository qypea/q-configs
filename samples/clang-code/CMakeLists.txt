project(ClangCode)
cmake_minimum_required(VERSION 3.22)

add_compile_options(-Wall -Wextra -Werror)
add_executable(test a.c)
