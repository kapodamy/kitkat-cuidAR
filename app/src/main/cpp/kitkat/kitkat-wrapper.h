#ifndef CUIDAR_KITKAT_KITKAT_WRAPPER_H
#define CUIDAR_KITKAT_KITKAT_WRAPPER_H

#include <ctime>
#include <cstdio>
#include <unwind.h>

typedef __WINT_TYPE__ wint_k;
typedef struct {
    unsigned char __seq[4];
#ifdef __LP64__
    unsigned char __reserved[4];
#endif
} mbstate_k;

typedef time_t time_k;
typedef FILE FILE_k;
typedef wchar_t wchar_k;
typedef pthread_mutex_t pthread_mutex_k;
typedef pthread_t pthread_k;
typedef pthread_mutexattr_t pthread_mutexattr_k;
typedef pthread_cond_t pthread_cond_k;
typedef pthread_key_t pthread_key_k;
typedef pthread_once_t pthread_once_k;
typedef pthread_attr_t pthread_attr_k;
typedef _Unwind_Ptr _Unwind_Ptr_k;

extern "C" {
    size_t mbrtowc(wchar_k *buf, const char *s, size_t n, mbstate_k *ps);
    int mbsinit(const mbstate_k* __ps);
    size_t wcrtomb(char *buf, wchar_k wc, mbstate_k *ps);
    wint_k towlower(wint_k wc);
    int iswspace(wint_k wc);
    extern FILE __sF[];
};
#endif
