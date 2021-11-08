#!/bin/bash

cd $( cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P )

cp ./format ../.clang-format && \
\
find ../ -regex ".*\.[ch]\(pp\)?" | xargs clang-format -i && \
\
rm ../.clang-format
