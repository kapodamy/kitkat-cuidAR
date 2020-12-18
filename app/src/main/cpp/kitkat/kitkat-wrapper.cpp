#include <android/log.h>
#include <dlfcn-nodladdr.h>
#include "kitkat-wrapper.h"

static void* lib;

static void LOG(int prio, const char *fmt, ...) {
    va_list ap;
    va_start(ap, fmt);
    __android_log_vprint(prio, "kitkat-wrapper", fmt, ap);
    va_end(ap);
}


// delegates

void (*$__stack_chk_fail)();

void *(*$__memcpy_chk)(void *dest, const void *src, size_t copy_amount, size_t dest_len);

size_t (*$strlen)(const char *s);

long (*$sysconf)(int name);

long (*$syscall)(long number, ...);

void *(*$memmove)(void *dst, const void *src, size_t n);

time_k(*$time)(time_k*t);

void *(*$memcpy)(void *const dst, const void *src, size_t copy_amount);

char *(*$strcpy)(char *const dst, const char *src);

void *(*$memset)(void *const s, int c, size_t n);

void (*$free)(void *ptr);

void *(*$malloc)(size_t byte_count);

void *(*$realloc)(void *ptr, size_t byte_count);

void *(*$calloc)(size_t item_count, size_t item_size);

size_t (*$fwrite)(const void *buf, size_t size, size_t count, FILE_k *fp);

int (*$fflush)(FILE_k *fp);

int (*$ungetc)(int ch, FILE_k *fp);

int (*$getc)(FILE_k *fp);

int (*$toupper)(int ch);

wint_k (*$towupper)(wint_k wc);

int (*$tolower)(int ch);

size_t (*$strxfrm)(char *dst, const char *src, size_t n);

size_t (*$strftime)(char *buf, size_t n, const char *fmt, const struct tm *tm);

int (*$strcoll)(const char *lhs, const char *rhs);

double (*$strtod)(const char *s, char **end_ptr);

int (*$snprintf)(char *const dest, size_t size, const char *format, ...);

int (*$strcmp)(const char *lhs, const char *rhs);

int (*$sscanf)(const char *s, const char *fmt, ...);

size_t (*$mbstowcs)(wchar_k *dst, const char *src, size_t n);

int (*$memcmp)(const void *lhs, const void *rhs, size_t n);

size_t (*$mbrlen)(const char *s, size_t n, mbstate_k *ps);

size_t (*$mbrtowc)(wchar_k *buf, const char *s, size_t n, mbstate_k *ps);

int (*$iswupper)(wint_k wc);

int (*$iswspace)(wint_k wc);

int (*$isxdigit)(int ch);

int (*$iswxdigit)(wint_k wc);

int (*$iswlower)(wint_k wc);

int (*$iswdigit)(wint_k wc);

int (*$iswpunct)(wint_k wc);

int (*$iswprint)(wint_k wc);

int (*$isupper)(int ch);

int (*$islower)(int ch);

int (*$iswcntrl)(wint_k wc);

int (*$iswalpha)(wint_k wc);

wint_k (*$btowc)(int ch);

int *(*$__errno)();

int (*$isblank)(int ch);

int (*$vasprintf)(char **s_ptr, const char *fmt, va_list args);

int (*$vsnprintf)(char *buf, size_t size, const char *fmt, va_list args);

int (*$vsscanf)(const char *s, const char *fmt, va_list args);

size_t (*$wcrtomb)(char *buf, wchar_k wc, mbstate_k *ps);

int (*$wcscoll)(const wchar_k *lhs, const wchar_k *rhs);

size_t (*$wcslen)(const wchar_k *s);

size_t (*$wcsxfrm)(wchar_k *dst, const wchar_k *src, size_t n);

int (*$wctob)(wint_k wc);

wchar_k *(*$wmemset)(wchar_k *dst, wchar_k wc, size_t n);

int (*$posix_memalign)(void **memptr, size_t alignment, size_t size);

int (*$pthread_mutexattr_settype)(pthread_mutexattr_k *attr, int type);

int (*$pthread_mutexattr_init)(pthread_mutexattr_k *attr);

pthread_k (*$pthread_self)();

int (*$pthread_mutex_destroy)(pthread_mutex_k *mutex);

int (*$pthread_equal)(pthread_k lhs, pthread_k rhs);

int (*$pthread_mutexattr_destroy)(pthread_mutexattr_k *attr);

int (*$pthread_mutex_init)(pthread_mutex_k *mutex, const pthread_mutexattr_k *attr);

int (*$pthread_mutex_lock)(pthread_mutex_k *mutex);

int (*$pthread_cond_broadcast)(pthread_cond_k *cond);

int (*$pthread_mutex_trylock)(pthread_mutex_k *mutex);

int (*$pthread_mutex_unlock)(pthread_mutex_k *mutex);

int (*$sched_yield)();

void *(*$memchr)(const void *s, int ch, size_t n);

long long (*$strtoll)(const char *s, char **end_ptr, int base);

long (*$strtol)(const char *s, char **end_ptr, int base);

unsigned long (*$strtoul)(const char *s, char **end_ptr, int base);

unsigned long long (*$strtoull)(const char *s, char **end_ptr, int base);

int (*$swprintf)(wchar_k *buf, size_t n, const wchar_k *fmt, ...);

int (*$vswprintf)(wchar_k* buf, size_t n, const wchar_k* fmt, va_list args);

double (*$wcstod)(const wchar_k *s, wchar_k **end_ptr);

long (*$wcstol)(const wchar_k *s, wchar_k **end_ptr, int base);

unsigned long (*$wcstoul)(const wchar_k *s, wchar_k **end_ptr, int base);

wchar_k *(*$wmemchr)(const wchar_k *src, wchar_k wc, size_t n);

int (*$wmemcmp)(const wchar_k *lhs, const wchar_k *rhs, size_t n);

wchar_k *(*$wmemmove)(wchar_k *dst, const wchar_k *src, size_t n);

int (*$pthread_setspecific)(pthread_key_k key, const void *value);

int (*$pthread_cond_destroy)(pthread_cond_k *cond);

int (*$pthread_cond_signal)(pthread_cond_k *cond);

void *(*$pthread_getspecific)(pthread_key_k key);

int (*$pthread_key_create)(pthread_key_k *key_ptr, void (*key_destructor)(void *));

int (*$nanosleep)(const struct timespec *request, struct timespec *remainder);

int (*$pthread_join)(pthread_k pthread, void **return_value_ptr);

int (*$pthread_detach)(pthread_k pthread);

int (*$strerror_r)(int errno_value, char *buf, size_t n);

int (*$pthread_once)(pthread_once_k *once, void (*init_routine)(void));

void (*$__assert2)(const char *FILE_k, int line, const char *function, const char *msg);

int (*$vfprintf)(FILE_k *fp, const char *fmt, va_list args);

int (*$fputc)(int ch, FILE_k *fp);

int (*$pthread_create)(pthread_k *p, pthread_attr_k const *attr, void *(*r)(void *), void *args);

wchar_k* (*$wmemcpy)(wchar_k* dst, const wchar_k* src, size_t n);

size_t (*$mbsrtowcs)(wchar_k* dst, const char** src, size_t dst_n, mbstate_k* ps);

wint_k (*$towlower)(wint_k wc);

int (*$mbsinit)(const mbstate_k* ps);

int (*$pthread_cond_wait)(pthread_cond_k* cond, pthread_mutex_k* mutex);

__noreturn void (*$abort)();

int (*$open)(char* path, int flags);

int (*$close)(int fd);

ssize_t (*$read)(int fd, void * buf, size_t nbytes);

int (*$dladdr)(const void* addr, Dl_info* info);

int (*$raise)(int signal);

_Unwind_Ptr_k (*$__gnu_Unwind_Find_exidx)(_Unwind_Ptr_k pc, int *pcount);


// functions

extern "C" void __stack_chk_fail() {
    return (*$__stack_chk_fail)();
}

extern "C" void *__memcpy_chk(void *dest, const void *src, size_t copy_amount, size_t dest_len) {
    return (*$__memcpy_chk)(dest, src, copy_amount, dest_len);
}

extern "C" size_t strlen(const char *s) {
    return (*$strlen)(s);
}

extern "C" long sysconf(int name) {
    return (*$sysconf)(name);
}

extern "C" long syscall(long number, ...) {
    /////////////////////////////////////////////////////////////////////////////////
    /// cuidAR is calling the syscall SYS_gettid (0xE0), no arguments required :) ///
    /////////////////////////////////////////////////////////////////////////////////
    va_list ap;
    va_start(ap, number);
    long ret = (*$syscall)(number);
    va_end(ap);
    return ret;
}

extern "C" void *memmove(void *dst, const void *src, size_t n) {
    return (*$memmove)(dst, src, n);
}

extern "C" time_k time(time_k*t) {
    return (*$time)(t);
}

extern "C" void *memcpy(void *const dst, const void *src, size_t copy_amount) {
    return (*$memcpy)(dst, src, copy_amount);
}

extern "C" char *strcpy(char *const dst, const char *src) {
    return (*$strcpy)(dst, src);
}

extern "C" void *memset(void *const s, int c, size_t n) {
    return (*$memset)(s, c, n);
}

extern "C" void free(void *ptr) {
    return (*$free)(ptr);
}

extern "C" void *malloc(size_t byte_count) {
    return (*$malloc)(byte_count);
}

extern "C" void *realloc(void *ptr, size_t byte_count) {
    return (*$realloc)(ptr, byte_count);
}

extern "C" void *calloc(size_t item_count, size_t item_size) {
    return (*$calloc)(item_count, item_size);
}

extern "C" size_t fwrite(const void *buf, size_t size, size_t count, FILE_k *fp) {
    return (*$fwrite)(buf, size, count, fp);
}

extern "C" int fflush(FILE_k *fp) {
    return (*$fflush)(fp);
}

extern "C" int ungetc(int ch, FILE_k *fp) {
    return (*$ungetc)(ch, fp);
}

extern "C" int getc(FILE_k *fp) {
    return (*$getc)(fp);
}

extern "C" int toupper(int ch) {
    return (*$toupper)(ch);
}

extern "C" wint_k towupper(wint_k wc) {
    return (*$towupper)(wc);
}

extern "C" int tolower(int ch) {
    return (*$tolower)(ch);
}

extern "C" size_t strxfrm(char *dst, const char *src, size_t n) {
    return (*$strxfrm)(dst, src, n);
}

extern "C" size_t strftime(char *buf, size_t n, const char *fmt, const struct tm *tm) {
    return (*$strftime)(buf, n, fmt, tm);
}

extern "C" int strcoll(const char *lhs, const char *rhs) {
    return (*$strcoll)(lhs, rhs);
}

extern "C" double strtod(const char *s, char **end_ptr) {
    return (*$strtod)(s, end_ptr);
}

extern "C" int snprintf(char *const dest, size_t size, const char *format, ...) {
    va_list ap;
    va_start( ap, format );
    int ret = (*$vsnprintf)(dest, size, format, ap);
    va_end(ap);
    return ret;
}

extern "C" int strcmp(const char *lhs, const char *rhs) {
    return (*$strcmp)(lhs, rhs);
}

extern "C" int sscanf(const char *s, const char *fmt, ...) {
    va_list ap;
    va_start(ap, fmt);
    int ret = (*$vsscanf)(s, fmt, ap);
    va_end(ap);
    return ret;
}

extern "C" size_t mbstowcs(wchar_k *dst, const char *src, size_t n) {
    return (*$mbstowcs)(dst, src, n);
}

extern "C" int memcmp(const void *lhs, const void *rhs, size_t n) {
    return (*$memcmp)(lhs, rhs, n);
}

extern "C" size_t mbrlen(const char *s, size_t n, mbstate_k *ps) {
    return (*$mbrlen)(s, n, ps);
}

size_t mbrtowc(wchar_k *buf, const char *s, size_t n, mbstate_k *ps) {
    return (*$mbrtowc)(buf, s, n, ps);
}

extern "C" int iswupper(wint_k wc) {
    return (*$iswupper)(wc);
}

int iswspace(wint_k wc) {
    return (*$iswspace)(wc);
}

extern "C" int isxdigit(int ch) {
    return (*$isxdigit)(ch);
}

extern "C" int iswxdigit(wint_k wc) {
    return (*$iswxdigit)(wc);
}

extern "C" int iswlower(wint_k wc) {
    return (*$iswlower)(wc);
}

extern "C" int iswdigit(wint_k wc) {
    return (*$iswdigit)(wc);
}

extern "C" int iswpunct(wint_k wc) {
    return (*$iswpunct)(wc);
}

extern "C" int iswprint(wint_k wc) {
    return (*$iswprint)(wc);
}

extern "C" int isupper(int ch) {
    return (*$isupper)(ch);
}

extern "C" int islower(int ch) {
    return (*$islower)(ch);
}

extern "C" int iswcntrl(wint_k wc) {
    return (*$iswcntrl)(wc);
}

extern "C" int iswalpha(wint_k wc) {
    return (*$iswalpha)(wc);
}

extern "C" wint_k btowc(int ch) {
    return (*$btowc)(ch);
}

extern "C" int *__errno(void) {
    return (*$__errno)();
}

extern "C" int isblank(int ch) {
    return (*$isblank)(ch);
}

extern "C" int vasprintf(char **s_ptr, const char *fmt, va_list args) {
    return (*$vasprintf)(s_ptr, fmt, args);
}

extern "C" int vsnprintf(char *buf, size_t size, const char *fmt, va_list args) {
    return (*$vsnprintf)(buf, size, fmt, args);
}

extern "C" int vsscanf(const char *s, const char *fmt, va_list args) {
    return (*$vsscanf)(s, fmt, args);
}

size_t wcrtomb(char *buf, wchar_k wc, mbstate_k *ps) {
    return (*$wcrtomb)(buf, wc, ps);
}

extern "C" int wcscoll(const wchar_k *lhs, const wchar_k *rhs) {
    return (*$wcscoll)(lhs, rhs);
}

extern "C" size_t wcslen(const wchar_k *s) {
    return (*$wcslen)(s);
}

extern "C" size_t wcsxfrm(wchar_k *dst, const wchar_k *src, size_t n) {
    return (*$wcsxfrm)(dst, src, n);
}

extern "C" int wctob(wint_k wc) {
    return (*$wctob)(wc);
}

extern "C" wchar_k *wmemset(wchar_k *dst, wchar_k wc, size_t n) {
    return (*$wmemset)(dst, wc, n);
}

extern "C" int posix_memalign(void **memptr, size_t alignment, size_t size) {
    return (*$posix_memalign)(memptr, alignment, size);
}

extern "C" int pthread_mutexattr_settype(pthread_mutexattr_k *attr, int type) {
    return (*$pthread_mutexattr_settype)(attr, type);
}

extern "C" int pthread_mutexattr_init(pthread_mutexattr_k *attr) {
    return (*$pthread_mutexattr_init)(attr);
}

extern "C" pthread_k pthread_self(void) {
    return (*$pthread_self)();
}

extern "C" int pthread_mutex_destroy(pthread_mutex_k *mutex) {
    return (*$pthread_mutex_destroy)(mutex);
}

extern "C" int pthread_equal(pthread_k lhs, pthread_k rhs) {
    return (*$pthread_equal)(lhs, rhs);
}

extern "C" int pthread_mutexattr_destroy(pthread_mutexattr_k *attr) {
    return (*$pthread_mutexattr_destroy)(attr);
}

extern "C" int pthread_mutex_init(pthread_mutex_k *mutex, const pthread_mutexattr_k *attr) {
    return (*$pthread_mutex_init)(mutex, attr);
}

extern "C" int pthread_mutex_lock(pthread_mutex_k *mutex) {
    return (*$pthread_mutex_lock)(mutex);
}

extern "C" int pthread_cond_broadcast(pthread_cond_k *cond) {
    return (*$pthread_cond_broadcast)(cond);
}

extern "C" int pthread_mutex_trylock(pthread_mutex_k *mutex) {
    return (*$pthread_mutex_trylock)(mutex);
}

extern "C" int pthread_mutex_unlock(pthread_mutex_k *mutex) {
    return (*$pthread_mutex_unlock)(mutex);
}

extern "C" int sched_yield(void) {
    return (*$sched_yield)();
}

extern "C" void *memchr(const void *s, int ch, size_t n) {
    return (*$memchr)(s, ch, n);
}

extern "C" long long strtoll(const char *s, char **end_ptr, int base) {
    return (*$strtoll)(s, end_ptr, base);
}

extern "C" long strtol(const char *s, char **end_ptr, int base) {
    return (*$strtol)(s, end_ptr, base);
}

extern "C" unsigned long strtoul(const char *s, char **end_ptr, int base) {
    return (*$strtoul)(s, end_ptr, base);
}

extern "C" unsigned long long strtoull(const char *s, char **end_ptr, int base) {
    return (*$strtoull)(s, end_ptr, base);
}

extern "C" int vswprintf(wchar_t* buf, size_t n, const wchar_t* fmt, va_list args) {
    return (*$vswprintf)(buf, n, fmt, args);
}

extern "C" int swprintf(wchar_k *buf, size_t n, const wchar_k *fmt, ...) {
    va_list ap;
    va_start(ap, fmt);
    int ret = vswprintf(buf, n, fmt, ap);
    va_end(ap);
    return ret;
}

extern "C" double wcstod(const wchar_k *s, wchar_k **end_ptr) {
    return (*$wcstod)(s, end_ptr);
}

extern "C" long wcstol(const wchar_k *s, wchar_k **end_ptr, int base) {
    return (*$wcstol)(s, end_ptr, base);
}

extern "C" unsigned long wcstoul(const wchar_k *s, wchar_k **end_ptr, int base) {
    return (*$wcstoul)(s, end_ptr, base);
}

extern "C" wchar_k *wmemchr(const wchar_k *src, wchar_k wc, size_t n) {
    return (*$wmemchr)(src, wc, n);
}

extern "C" int wmemcmp(const wchar_k *lhs, const wchar_k *rhs, size_t n) {
    return (*$wmemcmp)(lhs, rhs, n);
}

extern "C" wchar_k *wmemmove(wchar_k *dst, const wchar_k *src, size_t n) {
    return (*$wmemmove)(dst, src, n);
}

extern "C" int pthread_setspecific(pthread_key_k key, const void *value) {
    return (*$pthread_setspecific)(key, value);
}

extern "C" int pthread_cond_destroy(pthread_cond_k *cond) {
    return (*$pthread_cond_destroy)(cond);
}

extern "C" int pthread_cond_signal(pthread_cond_k *cond) {
    return (*$pthread_cond_signal)(cond);
}

extern "C" void *pthread_getspecific(pthread_key_k key) {
    return (*$pthread_getspecific)(key);
}

extern "C" int pthread_key_create(pthread_key_k *key_ptr, void (*key_destructor)(void *)) {
    return (*$pthread_key_create)(key_ptr, key_destructor);
}

extern "C" int nanosleep(const struct timespec *request, struct timespec *remainder) {
    return (*$nanosleep)(request, remainder);
}

extern "C" int pthread_join(pthread_k pthread, void **return_value_ptr) {
    return (*$pthread_join)(pthread, return_value_ptr);
}

extern "C" int pthread_detach(pthread_k pthread) {
    return (*$pthread_detach)(pthread);
}

extern "C" int strerror_r(int errno_value, char *buf, size_t n) {
    return (*$strerror_r)(errno_value, buf, n);
}

extern "C" int pthread_once(pthread_once_k *once, void (*init_routine)()) {
    return (*$pthread_once)(once, init_routine);
}

extern "C" void __assert2(const char *FILE_k, int line, const char *function, const char *msg) {
    return (*$__assert2)(FILE_k, line, function, msg);
}

extern "C" int vfprintf(FILE_k *fp, const char *fmt, va_list args) {
    return (*$vfprintf)(fp, fmt, args);
}

extern "C" int fputc(int ch, FILE_k *fp) {
    return (*$fputc)(ch, fp);
}

extern "C" int pthread_create(pthread_k *p, pthread_attr_k const *attr, void *(*r)(void *), void *arg) {
    return (*$pthread_create)(p, attr, r, arg);
}

extern "C" wchar_k* wmemcpy(wchar_k* dst, const wchar_k* src, size_t n) {
    return (*$wmemcpy)(dst, src, n);
}

extern "C" size_t mbsrtowcs(wchar_k* dst, const char** src, size_t dst_n, mbstate_k* ps) {
    return (*$mbsrtowcs)(dst, src, dst_n, ps);
}

extern "C" int pthread_cond_wait(pthread_cond_k* cond, pthread_mutex_k* mutex) {
    return (*$pthread_cond_wait)(cond, mutex);
}

__noreturn extern "C" void abort() {
    (*$abort)();
}

extern "C" int open(char *path, int flags) {
    return (*$open)(path, flags);
}

extern "C" int close(int fd) {
    return (*$close)(fd);
}

extern "C" ssize_t read(int fd, void * buf, size_t nbytes) {
    return (*$read)(fd, buf, nbytes);
}

extern "C" int fprintf(FILE* fp , const char* fmt, ...) {
    va_list ap;
    va_start(ap, fmt);
    int ret = (*$vfprintf)(fp, fmt, ap);
    va_end(ap);
    return ret;
}

extern "C" int dladdr(const void* addr, Dl_info* info) {
    return (*$dladdr)(addr, info);
}

extern "C" int raise(int signal) {
    return (*$raise)(signal);

}

extern "C" _Unwind_Ptr_k __gnu_Unwind_Find_exidx(_Unwind_Ptr_k pc, int *pcount) {
    return (*$__gnu_Unwind_Find_exidx)(pc, pcount);
}

wint_k towlower(wint_k wc) {
    return (*$towlower)(wc);
}

int mbsinit(const mbstate_k* ps) {
    return (*$mbsinit)(ps);
}

FILE __sF[3];

// platforms specifics functions

#if defined(__arm__)

void (*$__aeabi_memset4)(void *dest, size_t n, int c);

void (*$__aeabi_memset8)(void *dest, size_t n, int c);

void (*$__aeabi_memcpy)(void *dest, const void *src, size_t n);

void (*$__aeabi_memset)(void *dest, size_t n, int c);

void (*$__aeabi_memmove)(void *dest, const void *src, size_t n);

void (*$__aeabi_memclr4)(void *dest, size_t n);

void (*$__aeabi_memclr8)(void *dest, size_t n);

void (*$__aeabi_memcpy4)(void *dest, const void *src, size_t n);

void (*$__aeabi_memmove4)(void *dest, const void *src, size_t n);

void (*$__aeabi_memclr)(void *dest, size_t n);


extern "C" void __aeabi_memset4(void *dest, size_t n, int c) {
    (*$__aeabi_memset4)(dest, n, c);
}

extern "C" void __aeabi_memset8(void *dest, size_t n, int c) {
    (*$__aeabi_memset8)(dest, n, c);
}

extern "C" void __aeabi_memcpy(void *dest, const void *src, size_t n) {
    (*$__aeabi_memcpy)(dest, src, n);
}

extern "C" void __aeabi_memset(void *dest, size_t n, int c) {
    //LOG(ANDROID_LOG_VERBOSE, "__aeabi_memset(%p, &d, %d)", dest, n, c);
    (*$memset)(dest, c, n);
}

extern "C" void __aeabi_memmove(void *dest, const void *src, size_t n) {
    (*$__aeabi_memmove)(dest, src, n);
}

extern "C" void __aeabi_memclr4(void *dest, size_t n) {
    (*$__aeabi_memclr4)(dest, n);
}

extern "C" void __aeabi_memclr8(void *dest, size_t n) {
    (*$__aeabi_memclr8)(dest, n);
}

extern "C" void __aeabi_memcpy4(void *dest, const void *src, size_t n) {
    (*$__aeabi_memcpy4)(dest, src, n);
}

extern "C" void __aeabi_memmove4(void *dest, const void *src, size_t n) {
    (*$__aeabi_memmove4)(dest, src, n);
}

extern "C" void __aeabi_memclr(void *dest, size_t n) {
    (*$__aeabi_memclr)(dest, n);
}

int dladdr_mock(const void* addr, Dl_info* info) {
    return 0;
}

#elif defined(x86_64) || defined(__aarch64__)
float (*$strtof)(const char* nptr, char** endptr);

int (*$iswblank)(wint_k ch);

long double(*$wcstold)(const wchar_k* s, wchar_k** end_ptr);

void (*$closelog)();

void (*$openlog)(const char* prefix, int option, int facility);

void (*$vsyslog)(int priority, const char* fmt, va_list args);

void (*$android_set_abort_message)(const char* msg);

int (*$__open_2)(const char *pathname, int flags);

int(*$__vsnprintf_chk)(char *dst, size_t sz, int f, size_t dst_ln, const char *fmt, va_list va);

void *(*$__memmove_chk )(void *dest, const void *src, size_t len, size_t dest_len);

size_t (*$__strlen_chk)(const char *s, size_t s_len);

void (*$__fortify_chk_fail)(const char* msg, uint32_t event_tag);


extern "C" float strtof(const char* nptr, char** endptr) {
    return (*$strtof)(nptr, endptr);
}

extern "C" int iswblank(wint_k ch) {
    return (*$iswblank)(ch);
}

extern "C" long double wcstold(const wchar_k* s, wchar_k** end_ptr) {
    return (*$wcstold)(s, end_ptr);
}

extern "C" void closelog() {
    return (*$closelog)();
}

extern "C" void openlog(const char* prefix, int option, int facility) {
    return (*$openlog)(prefix, option, facility);
}

extern "C" void syslog(int priority, const char* fmt, ...) {
    va_list ap;
    va_start(ap, fmt);
    (*$vsyslog)(priority, fmt, ap);
    va_end(ap);
}

extern "C" void android_set_abort_message(const char* msg) {
    return (*$android_set_abort_message)(msg);
}

extern "C" int __open_2(const char *pathname, int flags) {
    return (*$__open_2)(pathname, flags);
}

extern "C" int __vsnprintf_chk(char *d, size_t s, int f, size_t l, const char *fmt, va_list v) {
    return (*$__vsnprintf_chk)(d, s, f, l, fmt, v);
}

extern "C" void *__memmove_chk (void *dest, const void *src, size_t len, size_t dest_len) {
    return (*$__memmove_chk)(dest, src, len, dest_len);
}

extern "C" size_t __strlen_chk(const char *s, size_t s_len) {
    return (*$__strlen_chk)(s, s_len);
}

extern "C" ssize_t __read_chk(int fd, void* buf, size_t count, size_t buf_size) {
    if (__predict_false(count > buf_size)) {
        (*$__fortify_chk_fail)("read prevented write past end of buffer", 0);
    }
    if (__predict_false(count > SSIZE_MAX)) {
        (*$__fortify_chk_fail)("read count > SSIZE_MAX", 0);
    }
    return (*$read)(fd, buf, count);
}
#endif

// delegates assigners

void *load_symbol(const char *name) {
    void *ptr = dlsym(lib, name);
    if (!ptr) {
        LOG(ANDROID_LOG_ERROR, "can not load symbol \"%s\". reason: %s", name, dlerror());
    }
    return ptr;
}

__used static void __attribute__((constructor)) constructor() {
#if defined(__arm__)
    LOG(ANDROID_LOG_INFO, "initialize on armeabi-v7a");
#elif defined(x86_64) || defined(__aarch64__)
    LOG(ANDROID_LOG_INFO, "initialize on x86_64/arm64-v8a");
#endif

    lib = dlopen("libc.so", RTLD_LAZY);
    if (!lib) {
        LOG(ANDROID_LOG_FATAL, "can not wrap libc.so, reason: %s", dlerror());
    }

    *(void **) (&__sF) = load_symbol("__sF");

    *(void **) (&$__stack_chk_fail) = load_symbol("__stack_chk_fail");
    *(void **) (&$__memcpy_chk) = load_symbol("__memcpy_chk");
    *(void **) (&$strlen) = load_symbol("strlen");
    *(void **) (&$sysconf) = load_symbol("sysconf");
    *(void **) (&$syscall) = load_symbol("syscall");
    *(void **) (&$memmove) = load_symbol("memmove");
    *(void **) (&$time) = load_symbol("time");
    *(void **) (&$memcpy) = load_symbol("memcpy");
    *(void **) (&$strcpy) = load_symbol("strcpy");
    *(void **) (&$memset) = load_symbol("memset");
    *(void **) (&$free) = load_symbol("free");
    *(void **) (&$malloc) = load_symbol("malloc");
    *(void **) (&$realloc) = load_symbol("realloc");
    *(void **) (&$calloc) = load_symbol("calloc");
    *(void **) (&$fwrite) = load_symbol("fwrite");
    *(void **) (&$fflush) = load_symbol("fflush");
    *(void **) (&$ungetc) = load_symbol("ungetc");
    *(void **) (&$getc) = load_symbol("getc");
    *(void **) (&$toupper) = load_symbol("toupper");
    *(void **) (&$towupper) = load_symbol("towupper");
    *(void **) (&$tolower) = load_symbol("tolower");
    *(void **) (&$strxfrm) = load_symbol("strxfrm");
    *(void **) (&$strftime) = load_symbol("strftime");
    *(void **) (&$strcoll) = load_symbol("strcoll");
    *(void **) (&$strtod) = load_symbol("strtod");
    *(void **) (&$snprintf) = load_symbol("snprintf");
    *(void **) (&$strcmp) = load_symbol("strcmp");
    *(void **) (&$sscanf) = load_symbol("sscanf");
    *(void **) (&$mbstowcs) = load_symbol("mbstowcs");
    *(void **) (&$memcmp) = load_symbol("memcmp");
    *(void **) (&$mbrlen) = load_symbol("mbrlen");
    *(void **) (&$mbrtowc) = load_symbol("mbrtowc");
    *(void **) (&$iswupper) = load_symbol("iswupper");
    *(void **) (&$iswspace) = load_symbol("iswspace");
    *(void **) (&$isxdigit) = load_symbol("isxdigit");
    *(void **) (&$iswxdigit) = load_symbol("iswxdigit");
    *(void **) (&$iswlower) = load_symbol("iswlower");
    *(void **) (&$iswdigit) = load_symbol("iswdigit");
    *(void **) (&$iswpunct) = load_symbol("iswpunct");
    *(void **) (&$iswprint) = load_symbol("iswprint");
    *(void **) (&$isupper) = load_symbol("isupper");
    *(void **) (&$islower) = load_symbol("islower");
    *(void **) (&$iswcntrl) = load_symbol("iswcntrl");
    *(void **) (&$iswalpha) = load_symbol("iswalpha");
    *(void **) (&$btowc) = load_symbol("btowc");
    *(void **) (&$__errno) = load_symbol("__errno");
    *(void **) (&$isblank) = load_symbol("isblank");
    *(void **) (&$vasprintf) = load_symbol("vasprintf");
    *(void **) (&$vsnprintf) = load_symbol("vsnprintf");
    *(void **) (&$vsscanf) = load_symbol("vsscanf");
    *(void **) (&$wcrtomb) = load_symbol("wcrtomb");
    *(void **) (&$wcscoll) = load_symbol("wcscoll");
    *(void **) (&$wcslen) = load_symbol("wcslen");
    *(void **) (&$wcsxfrm) = load_symbol("wcsxfrm");
    *(void **) (&$wctob) = load_symbol("wctob");
    *(void **) (&$wmemset) = load_symbol("wmemset");
    *(void **) (&$posix_memalign) = load_symbol("posix_memalign");
    *(void **) (&$pthread_mutexattr_settype) = load_symbol("pthread_mutexattr_settype");
    *(void **) (&$pthread_mutexattr_init) = load_symbol("pthread_mutexattr_init");
    *(void **) (&$pthread_self) = load_symbol("pthread_self");
    *(void **) (&$pthread_mutex_destroy) = load_symbol("pthread_mutex_destroy");
    *(void **) (&$pthread_equal) = load_symbol("pthread_equal");
    *(void **) (&$pthread_mutexattr_destroy) = load_symbol("pthread_mutexattr_destroy");
    *(void **) (&$pthread_mutex_init) = load_symbol("pthread_mutex_init");
    *(void **) (&$pthread_mutex_lock) = load_symbol("pthread_mutex_lock");
    *(void **) (&$pthread_cond_broadcast) = load_symbol("pthread_cond_broadcast");
    *(void **) (&$pthread_mutex_trylock) = load_symbol("pthread_mutex_trylock");
    *(void **) (&$pthread_mutex_unlock) = load_symbol("pthread_mutex_unlock");
    *(void **) (&$sched_yield) = load_symbol("sched_yield");
    *(void **) (&$memchr) = load_symbol("memchr");
    *(void **) (&$strtoll) = load_symbol("strtoll");
    *(void **) (&$strtol) = load_symbol("strtol");
    *(void **) (&$strtoul) = load_symbol("strtoul");
    *(void **) (&$strtoull) = load_symbol("strtoull");
    *(void **) (&$swprintf) = load_symbol("swprintf");
    *(void **) (&$vswprintf) = load_symbol("vswprintf");
    *(void **) (&$wcstod) = load_symbol("wcstod");
    *(void **) (&$wcstol) = load_symbol("wcstol");
    *(void **) (&$wcstoul) = load_symbol("wcstoul");
    *(void **) (&$wmemchr) = load_symbol("wmemchr");
    *(void **) (&$wmemcmp) = load_symbol("wmemcmp");
    *(void **) (&$wmemmove) = load_symbol("wmemmove");
    *(void **) (&$pthread_setspecific) = load_symbol("pthread_setspecific");
    *(void **) (&$pthread_cond_destroy) = load_symbol("pthread_cond_destroy");
    *(void **) (&$pthread_cond_signal) = load_symbol("pthread_cond_signal");
    *(void **) (&$pthread_getspecific) = load_symbol("pthread_getspecific");
    *(void **) (&$pthread_key_create) = load_symbol("pthread_key_create");
    *(void **) (&$nanosleep) = load_symbol("nanosleep");
    *(void **) (&$pthread_join) = load_symbol("pthread_join");
    *(void **) (&$pthread_detach) = load_symbol("pthread_detach");
    *(void **) (&$strerror_r) = load_symbol("strerror_r");
    *(void **) (&$pthread_once) = load_symbol("pthread_once");
    *(void **) (&$__assert2) = load_symbol("__assert2");
    *(void **) (&$vfprintf) = load_symbol("vfprintf");
    *(void **) (&$fputc) = load_symbol("fputc");
    *(void **) (&$pthread_create) = load_symbol("pthread_create");
    *(void **) (&$wmemcpy) = load_symbol("wmemcpy");
    *(void **) (&$mbsrtowcs) = load_symbol("mbsrtowcs");
    *(void **) (&$towlower) = load_symbol("towlower");
    *(void **) (&$mbsinit) = load_symbol("mbsinit");
    *(void **) (&$pthread_cond_wait) = load_symbol("pthread_cond_wait");
    *(void **) (&$open) = load_symbol("open");
    *(void **) (&$close) = load_symbol("close");
    *(void **) (&$abort) = load_symbol("abort");
    *(void **) (&$read) = load_symbol("read");

#if defined(__arm__)
    *(void **) (&$dladdr) = load_symbol("dladdr");
    *(void **) (&$raise) = load_symbol("raise");
    *(void **) (&$__gnu_Unwind_Find_exidx) = load_symbol("__gnu_Unwind_Find_exidx");
    *(void **) (&$__aeabi_memset4) = load_symbol("__aeabi_memset4");
    *(void **) (&$__aeabi_memset8) = load_symbol("__aeabi_memset8");
    *(void **) (&$__aeabi_memcpy) = load_symbol("__aeabi_memcpy");
    *(void **) (&$__aeabi_memset) = load_symbol("__aeabi_memset");
    *(void **) (&$__aeabi_memmove) = load_symbol("__aeabi_memmove");
    *(void **) (&$__aeabi_memclr4) = load_symbol("__aeabi_memclr4");
    *(void **) (&$__aeabi_memclr8) = load_symbol("__aeabi_memclr8");
    *(void **) (&$__aeabi_memcpy4) = load_symbol("__aeabi_memcpy4");
    *(void **) (&$__aeabi_memmove4) = load_symbol("__aeabi_memmove4");
    *(void **) (&$__aeabi_memclr) = load_symbol("__aeabi_memclr");

    if (!$dladdr) {
        LOG(ANDROID_LOG_WARN, "missing dladdr symbol in libc.so, using libdl.so instead");
        void* libdl = dlopen("libdl.so", RTLD_LAZY);
        if (libdl) {
            *(void **) (&$dladdr) = dlsym(libdl, "dladdr");
            if (!$dladdr) {
                LOG(ANDROID_LOG_WARN, "can not load dladdr symbol from lbdl.so. reason:%s", dlerror());
            }
        } else {
            LOG(ANDROID_LOG_WARN, "can not load lbdl.so library. reason:%s", dlerror());
        }
        if (!$dladdr) {
            LOG(ANDROID_LOG_ERROR, "can not load the dladdr symbol, mock it");
            $dladdr = dladdr_mock;
        }
    }

#elif defined(x86_64) || defined(__aarch64__)
    *(void **) (&$strtof) = load_symbol("strtof");
    *(void **) (&$iswblank) = load_symbol("iswblank");
    *(void **) (&$wcstold) = load_symbol("wcstold");
    *(void **) (&$closelog) = load_symbol("closelog");
    *(void **) (&$openlog) = load_symbol("openlog");
    *(void **) (&$vsyslog) = load_symbol("vsyslog");
    *(void **) (&$android_set_abort_message) = load_symbol("android_set_abort_message");
    *(void **) (&$__open_2) = load_symbol("__open_2");
    *(void **) (&$__vsnprintf_chk) = load_symbol("__vsnprintf_chk");
    *(void **) (&$__memmove_chk) = load_symbol("__memmove_chk");
    *(void **) (&$__strlen_chk) = load_symbol("__strlen_chk");
    *(void **) (&$__fortify_chk_fail) = load_symbol("__fortify_chk_fail");
#endif

    LOG(ANDROID_LOG_INFO, "symbols loading success");
}

