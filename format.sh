#!/bin/bash

cur_dir=$( cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P )

if (($# != 1)) || [ ! -d $1 ]; then
    echo "Usage: format.sh DIR" >&2
    exit 2
fi

cp "$cur_dir/.clang-format" "$1/" && \
\
find "$1" -regex ".*\.[ch]\(pp\)?" | xargs clang-format -i && \
\
rm "$1/.clang-format"
