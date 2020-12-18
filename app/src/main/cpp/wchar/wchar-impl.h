#include <cstdio>
#include <xlocale.h>
#include "../kitkat/kitkat-wrapper.h"



#ifndef CUIDAR_KITKAT_WCHAR_IMPL_H
#define CUIDAR_KITKAT_WCHAR_IMPL_H

extern "C" {
#define __MB_ERR_ILLEGAL_SEQUENCE static_cast<size_t>(-1)
#define __MB_ERR_INCOMPLETE_SEQUENCE static_cast<size_t>(-2)
#define ERR_ILLEGAL_SEQUENCE static_cast<size_t>(-1)

size_t wcsnrtombs(char *dst, const wchar_t **src, size_t nwc, size_t len, mbstate_k *ps);
int mbtowc(wchar_t *pwc, const char *s, size_t n);
unsigned long long strtoull_l(const char *n, char **e, int b, locale_t l);
long long strtoll_l(const char *nptr, char **endptr, int base, locale_t locale);
long long int strtoll_l_internal(const char *a, char **b, int i, int j, locale_t l);
long double strtold_l(const char *nptr, char **endptr, locale_t locale);
size_t mbsnrtowcs(wchar_t *dst, const char **src, size_t nmc, size_t len, mbstate_k *ps);
long long wcstoll(const wchar_t *nptr, wchar_t **endptr, int base);
float wcstof(const wchar_t *nptr, wchar_t **endptr);
unsigned long long int wcstoull(const wchar_t *nptr, wchar_t **endptr, int base);

};

#endif //CUIDAR_KITKAT_WCHAR_IMPL_H
