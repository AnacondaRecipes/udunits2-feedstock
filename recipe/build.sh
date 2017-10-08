#!/bin/bash

autoreconf -vfi

if [[ ! ${HOST} =~ .*darwin.* ]]; then
    export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"
    export CFLAGS="${CFLAGS} -I${PREFIX}/include"
fi

./configure --prefix=${PREFIX}  \
            --enable-static     \
            --enable-shared
make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
