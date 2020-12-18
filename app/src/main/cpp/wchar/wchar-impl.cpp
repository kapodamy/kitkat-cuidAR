#include "wchar-impl.h"
#include <climits>
#include <cstdio>
#include <cerrno>
#include <cstdlib>
#include <cstring>
#include <xlocale.h>

inline static int wctoint(wchar_t wc) {
    int n;
    switch (wc) {
        case L'0':
            n = 0;
            break;
        case L'1':
            n = 1;
            break;
        case L'2':
            n = 2;
            break;
        case L'3':
            n = 3;
            break;
        case L'4':
            n = 4;
            break;
        case L'5':
            n = 5;
            break;
        case L'6':
            n = 6;
            break;
        case L'7':
            n = 7;
            break;
        case L'8':
            n = 8;
            break;
        case L'9':
            n = 9;
            break;
        case L'A':
        case L'a':
            n = 10;
            break;
        case L'B':
        case L'b':
            n = 11;
            break;
        case L'C':
        case L'c':
            n = 12;
            break;
        case L'D':
        case L'd':
            n = 13;
            break;
        case L'E':
        case L'e':
            n = 14;
            break;
        case L'F':
        case L'f':
            n = 15;
            break;
        case L'G':
        case L'g':
            n = 16;
            break;
        case L'H':
        case L'h':
            n = 17;
            break;
        case L'I':
        case L'i':
            n = 18;
            break;
        case L'J':
        case L'j':
            n = 19;
            break;
        case L'K':
        case L'k':
            n = 20;
            break;
        case L'L':
        case L'l':
            n = 21;
            break;
        case L'M':
        case L'm':
            n = 22;
            break;
        case L'N':
        case L'n':
            n = 23;
            break;
        case L'O':
        case L'o':
            n = 24;
            break;
        case L'P':
        case L'p':
            n = 25;
            break;
        case L'Q':
        case L'q':
            n = 26;
            break;
        case L'R':
        case L'r':
            n = 27;
            break;
        case L'S':
        case L's':
            n = 28;
            break;
        case L'T':
        case L't':
            n = 29;
            break;
        case L'U':
        case L'u':
            n = 30;
            break;
        case L'V':
        case L'v':
            n = 31;
            break;
        case L'W':
        case L'w':
            n = 32;
            break;
        case L'X':
        case L'x':
            n = 33;
            break;
        case L'Y':
        case L'y':
            n = 34;
            break;
        case L'Z':
        case L'z':
            n = 35;
            break;
        default:
            n = -1;
            break; /* error */
    }
    return n;
}

wchar_t *wcschr(const wchar_t *s, wchar_t c) {
    while (*s != c && *s != L'\0')
        s++;
    if (*s == c)
        return ((wchar_t *) s);
    return (NULL);
}

int wcsncasecmp(const wchar_t *s1, const wchar_t *s2, size_t n) {
    wchar_t c1, c2;
    if (n == 0)
        return (0);
    for (; *s1; s1++, s2++) {
        c1 = towlower(*s1);
        c2 = towlower(*s2);
        if (c1 != c2)
            return ((int) c1 - c2);
        if (--n == 0)
            return (0);
    }
    return (-*s2);
}

size_t wcsspn(const wchar_t *s, const wchar_t *set) {
    const wchar_t *p;
    const wchar_t *q;
    p = s;
    while (*p) {
        q = set;
        while (*q) {
            if (*p == *q)
                break;
            q++;
        }
        if (!*q)
            goto done;
        p++;
    }
    done:
    return (p - s);
}

static size_t reset_and_return_illegal(int _errno, mbstate_k *ps) {
    errno = _errno;
    *(reinterpret_cast<uint32_t *>(ps->__seq)) = 0;
    return ERR_ILLEGAL_SEQUENCE;
}

static size_t reset_and_return(int _return, mbstate_k *ps) {
    *(reinterpret_cast<uint32_t *>(ps->__seq)) = 0;
    return _return;
}

/*int mbsinit(const mbstate_k *ps) {
    return (ps == NULL || (*(reinterpret_cast<const uint32_t *>(ps->__seq)) == 0));
}*/

static size_t mbstate_bytes_so_far(const mbstate_k *ps) {
    return
            (ps->__seq[2] != 0) ? 3 :
            (ps->__seq[1] != 0) ? 2 :
            (ps->__seq[0] != 0) ? 1 : 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

size_t mbsnrtowcs(wchar_t *dst, const char **src, size_t nmc, size_t len, mbstate_k *ps) {
    static mbstate_k __private_state;
    mbstate_k *state = (ps == NULL) ? &__private_state : ps;
    size_t i, o, r;
    if (dst == NULL) {
        /*
         * The fast path in the loop below is not safe if an ASCII
         * character appears as anything but the first byte of a
         * multibyte sequence. Check now to avoid doing it in the loop.
         */
        if ((nmc > 0) && (mbstate_bytes_so_far(state) > 0)
            && (static_cast<uint8_t>((*src)[0]) < 0x80)) {
            return reset_and_return_illegal(EILSEQ, state);
        }
        for (i = o = 0; i < nmc; i += r, o++) {
            if (static_cast<uint8_t>((*src)[i]) < 0x80) {
                // Fast path for plain ASCII characters.
                if ((*src)[i] == '\0') {
                    *src = nullptr;
                    return reset_and_return(o, state);
                }
                r = 1;
            } else {
                r = mbrtowc(NULL, *src + i, nmc - i, state);
                if (r == __MB_ERR_ILLEGAL_SEQUENCE) {
                    return reset_and_return_illegal(EILSEQ, state);
                }
                if (r == __MB_ERR_INCOMPLETE_SEQUENCE) {
                    return reset_and_return_illegal(EILSEQ, state);
                }
                if (r == 0) {
                    *src = nullptr;
                    return reset_and_return(o, state);
                }
            }
        }
        return reset_and_return(o, state);
    }
    /*
     * The fast path in the loop below is not safe if an ASCII
     * character appears as anything but the first byte of a
     * multibyte sequence. Check now to avoid doing it in the loop.
     */
    if ((nmc > 0) && (mbstate_bytes_so_far(state) > 0)
        && (static_cast<uint8_t>((*src)[0]) < 0x80)) {
        return reset_and_return_illegal(EILSEQ, state);
    }
    for (i = o = 0; i < nmc && o < len; i += r, o++) {
        if (static_cast<uint8_t>((*src)[i]) < 0x80) {
            // Fast path for plain ASCII characters.
            dst[o] = (*src)[i];
            r = 1;
            if ((*src)[i] == '\0') {
                *src = nullptr;
                return reset_and_return(o, state);
            }
        } else {
            r = mbrtowc(dst + o, *src + i, nmc - i, state);
            if (r == __MB_ERR_ILLEGAL_SEQUENCE) {
                *src += i;
                return reset_and_return_illegal(EILSEQ, state);
            }
            if (r == __MB_ERR_INCOMPLETE_SEQUENCE) {
                *src += nmc;
                return reset_and_return(EILSEQ, state);
            }
            if (r == 0) {
                *src = NULL;
                return reset_and_return(o, state);
            }
        }
    }
    *src += i;
    return reset_and_return(o, state);
}

size_t wcsnrtombs(char *dst, const wchar_t **src, size_t nwc, size_t len, mbstate_k *ps) {
    static mbstate_k __private_state;
    mbstate_k *state = (ps == NULL) ? &__private_state : ps;
    if (!mbsinit(state)) {
        return reset_and_return_illegal(EILSEQ, state);
    }
    char buf[MB_LEN_MAX];
    size_t i, o, r;
    if (dst == NULL) {
        for (i = o = 0; i < nwc; i++, o += r) {
            wchar_t wc = (*src)[i];
            if (static_cast<uint32_t>(wc) < 0x80) {
                // Fast path for plain ASCII characters.
                if (wc == 0) {
                    return o;
                }
                r = 1;
            } else {
                r = wcrtomb(buf, wc, state);
                if (r == __MB_ERR_ILLEGAL_SEQUENCE) {
                    return r;
                }
            }
        }
        return o;
    }
    for (i = o = 0; i < nwc && o < len; i++, o += r) {
        wchar_t wc = (*src)[i];
        if (static_cast<uint32_t>(wc) < 0x80) {
            // Fast path for plain ASCII characters.
            dst[o] = wc;
            if (wc == 0) {
                *src = NULL;
                return o;
            }
            r = 1;
        } else if (len - o >= sizeof(buf)) {
            // Enough space to translate in-place.
            r = wcrtomb(dst + o, wc, state);
            if (r == __MB_ERR_ILLEGAL_SEQUENCE) {
                *src += i;
                return r;
            }
        } else {
            // May not be enough space; use temp buffer.
            r = wcrtomb(buf, wc, state);
            if (r == __MB_ERR_ILLEGAL_SEQUENCE) {
                *src += i;
                return r;
            }
            if (r > len - o) {
                break;
            }
            memcpy(dst + o, buf, r);
        }
    }
    *src += i;
    return o;
}

int mbtowc(wchar_t *pwc, const char *s, size_t n) {
    static mbstate_k mbs;
    size_t rval;
    if (s == NULL) {
        /* No support for state dependent encodings. */
        memset(&mbs, 0, sizeof(mbs));
        return (0);
    }
    rval = mbrtowc(pwc, s, n, &mbs);
    if (rval == (size_t) -1 || rval == (size_t) -2)
        return (-1);
    return ((int) rval);
}

unsigned long long strtoull_l(const char *n, char **e, int b, locale_t l) {
    return strtoull(n, e, b);
}

long long strtoll_l(const char *nptr, char **endptr, int base, locale_t locale) {
    return strtoll(nptr, endptr, base);
}

long long int strtoll_l_internal(const char *a, char **b, int i, int j, locale_t l) {
    return strtoll(a, b, i);
}

long double strtold_l(const char *nptr, char **endptr, locale_t locale) {
    return strtold(nptr, endptr);
}

long long wcstoll(const wchar_t *nptr, wchar_t **endptr, int base) {
    const wchar_t *s;
    int acc, cutoff;
    int wc;
    int i;
    int neg, any, cutlim;
    /* check base value */
    if (base && (base < 2 || base > 36)) {
        errno = EINVAL;
        return 0;
    }
    /*
     * Skip white space and pick up leading +/- sign if any.
     * If base is 0, allow 0x for hex and 0 for octal, else
     * assume decimal; if base is already 16, allow 0x.
     */
    s = nptr;
    do {
        wc = (wchar_t) *s++;
    } while (iswspace(wc));
    if (wc == L'-') {
        neg = 1;
        wc = *s++;
    } else {
        neg = 0;
        if (wc == L'+')
            wc = *s++;
    }
    if ((base == 0 || base == 16) &&
        wc == L'0' && (*s == L'x' || *s == L'X')) {
        wc = s[1];
        s += 2;
        base = 16;
    }
    if (base == 0)
        base = wc == L'0' ? 8 : 10;
    /*
     * See strtol for comments as to the logic used.
     */
    cutoff = neg ? LLONG_MIN : LLONG_MAX;
    cutlim = (int) (cutoff % base);
    cutoff /= base;
    if (neg) {
        if (cutlim > 0) {
            cutlim -= base;
            cutoff += 1;
        }
        cutlim = -cutlim;
    }
    for (acc = 0, any = 0;; wc = (wchar_t) *s++) {
        i = wctoint(wc);
        if (i == -1)
            break;
        if (i >= base)
            break;
        if (any < 0)
            continue;
        if (neg) {
            if (acc < cutoff || (acc == cutoff && i > cutlim)) {
                any = -1;
                acc = LLONG_MIN;
                errno = ERANGE;
            } else {
                any = 1;
                acc *= base;
                acc -= i;
            }
        } else {
            if (acc > cutoff || (acc == cutoff && i > cutlim)) {
                any = -1;
                acc = LLONG_MAX;
                errno = ERANGE;
            } else {
                any = 1;
                acc *= base;
                acc += i;
            }
        }
    }
    if (endptr != 0)
        /* LINTED interface specification */
        *endptr = (wchar_t *) (any ? s - 1 : nptr);
    return (acc);
}

float wcstof(const wchar_t *nptr, wchar_t **endptr) {
    const wchar_t *src;
    size_t size;
    const wchar_t *start;
    const wchar_t *aftersign;
    /*
     * check length of string and call strtod
     */
    src = nptr;
    /* skip space first */
    while (iswspace(*src)) {
        src++;
    }
    /* get length of string */
    start = src;
    if (*src && wcschr(L"+-", *src))
        src++;
    aftersign = src;
    if (wcsncasecmp(src, L"inf", 3) == 0) {
        src += 3;
        if (wcsncasecmp(src, L"inity", 5) == 0)
            src += 5;
        goto match;
    }
    if (wcsncasecmp(src, L"nan", 3) == 0) {
        src += 3;
        if (*src == L'(') {
            size = 1;
            while (src[size] != L'\0' && src[size] != L')')
                size++;
            if (src[size] == L')')
                src += size + 1;
        }
        goto match;
    }
    size = wcsspn(src, L"0123456789");
    src += size;
    if (*src == L'.') {/* XXX use localeconv */
        src++;
        size = wcsspn(src, L"0123456789");
        src += size;
    }
    if (*src && wcschr(L"Ee", *src)) {
        src++;
        if (*src && wcschr(L"+-", *src))
            src++;
        size = wcsspn(src, L"0123456789");
        src += size;
    }
    match:
    size = src - start;
    /*
     * convert to a char-string and pass it to strtod.
     */
    if (src > aftersign) {
        mbstate_k st;
        char *buf;
        char *end;
        const wchar_t *s;
        size_t size_converted;
        float result;
        size_t bufsize;
        s = start;
        memset(&st, 0, sizeof(st));

        bufsize = wcsnrtombs(NULL, &s, size, 0, &st);
        buf = static_cast<char *>(malloc(bufsize + 1));
        if (!buf) {
            errno = ENOMEM; /* XXX */
            goto fail;
        }
        s = start;
        memset(&st, 0, sizeof(st));
        size_converted = wcsnrtombs(buf, &s, size, bufsize, &st);
        if (size_converted != bufsize) {
            /* XXX should not happen */
            free(buf);
            errno = EILSEQ;
            goto fail;
        }
        buf[bufsize] = 0;
        result = strtod(buf, &end);
        if (endptr) {
            const char *s = buf;
            memset(&st, 0, sizeof(st));
            size = mbsnrtowcs(NULL, &s, end - buf, 0, &st);
            /* LINTED bad interface */
            *endptr = (wchar_t *) start + size;
        }
        free(buf);
        return result;
    }
    fail:
    if (endptr)
        /* LINTED bad interface */
        *endptr = (wchar_t *) nptr;
    return 0;
}

unsigned long long int wcstoull(const wchar_t *nptr, wchar_t **endptr, int base) {
    const wchar_t *s;
    uint_t acc, cutoff;
    int wc;
    int i;
    int neg, any, cutlim;
    if (base && (base < 2 || base > 36)) {
        errno = EINVAL;
        return 0;
    }
    /*
     * Skip white space and pick up leading +/- sign if any.
     * If base is 0, allow 0x for hex and 0 for octal, else
     * assume decimal; if base is already 16, allow 0x.
     */
    s = nptr;
    do {
        wc = (wchar_t) *s++;
    } while (iswspace(wc));
    if (wc == L'-') {
        neg = 1;
        wc = *s++;
    } else {
        neg = 0;
        if (wc == L'+')
            wc = *s++;
    }
    if ((base == 0 || base == 16) &&
        wc == L'0' && (*s == L'x' || *s == L'X')) {
        wc = s[1];
        s += 2;
        base = 16;
    }
    if (base == 0)
        base = wc == L'0' ? 8 : 10;
    /*
     * See strtoul for comments as to the logic used.
     */
    cutoff = LLONG_MAX / (uint_t) base;
    cutlim = (int) (LLONG_MAX % (uint_t) base);
    for (acc = 0, any = 0;; wc = (wchar_t) *s++) {
        i = wctoint(wc);
        if (i == (int) -1)
            break;
        if (i >= base)
            break;
        if (any < 0)
            continue;
        if (acc > cutoff || (acc == cutoff && i > cutlim)) {
            any = -1;
            acc = LLONG_MAX;
            errno = ERANGE;
        } else {
            any = 1;
            acc *= (uint_t) base;
            acc += i;
        }
    }
    if (neg && any > 0)
        acc = -acc;
    if (endptr != 0)
        /* LINTED interface specification */
        *endptr = (wchar_t *) (any ? s - 1 : nptr);
    return (acc);
}
