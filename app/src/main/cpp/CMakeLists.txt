cmake_minimum_required(VERSION 3.4.1)

# android LogCat
find_library(log-lib log)

# kikat-cuidar
set(KITKAT_WRAPPER k)

add_library(
        ${KITKAT_WRAPPER} SHARED
        kitkat/kitkat-wrapper.cpp kitkat/kitkat-wrapper.h
        locale/locale-impl.cpp locale/locale-impl.h
        wchar/wchar-impl.cpp wchar/wchar-impl.h
        pthread/pthread-impl.cpp
        kitkat/stackchkguard-impl.cpp
)

add_library(atexit-wrapper atexit/atexit.c atexit/atexit.h)

target_link_libraries(${KITKAT_WRAPPER} ${log-lib} atexit-wrapper)# locale-wrapper)
