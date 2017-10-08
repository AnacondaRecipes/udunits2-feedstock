#!/bin/bash

if [ ! -f configure ];
then
   autoreconf -i --force
fi

if [[ $(uname) != Darwin ]]; then
    export LDFLAGS="-L$PREFIX/lib"
    export CFLAGS="-fPIC -I$PREFIX/include"
fi

./configure --prefix=$PREFIX --enable-static --enable-shared

make
make check
make install
