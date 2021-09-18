#!/bin/sh

set -e

clang-format-8 -style=file -i $(git ls-files *.?pp)

mkdir -p build
cd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
make all -j8
make test
