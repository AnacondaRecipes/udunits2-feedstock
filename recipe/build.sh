#!/bin/bash

autoreconf -vfi

export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"
export CFLAGS="${CFLAGS} -I${PREFIX}/include"
if [[ ${HOST} =~ .*darwin.* ]]; then
  export LDFLAGS="${LDFLAGS} -Wl,-rpath,${PREFIX}/lib"
fi

./configure --prefix=${PREFIX}  \
            --enable-static     \
            --enable-shared
make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
