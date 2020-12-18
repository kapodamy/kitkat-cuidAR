#include <sys/types.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>
#include "atexit.h"

int __atexit_invalid = 1;
struct atexit *__atexit;
static pthread_mutex_t   gAtExitLock = PTHREAD_MUTEX_INITIALIZER;

//wchar_t* wmemcpy( wchar_t* dest, const wchar_t* src, size_t count );

void  _thread_atexit_lock( void )
{
    pthread_mutex_lock( &gAtExitLock );
}
void _thread_atexit_unlock( void )
{
    pthread_mutex_unlock( &gAtExitLock );
}

void _ATEXIT_LOCK() {
    do {
        if (__isthreaded)
            _thread_atexit_lock();
    } while (0);
}

void _ATEXIT_UNLOCK() {
    do {
        if (__isthreaded)
            _thread_atexit_unlock();
    } while (0);
}


int __cxa_atexit(void (*func)(void *), void *arg, void *dso) {
    struct atexit *p = __atexit;
    struct atexit_fn *fnp;
    int pgsize = getpagesize();
    int ret = -1;
    if (pgsize < (int) sizeof(*p))
        return (-1);
    _ATEXIT_LOCK();
    p = __atexit;
    if (p != NULL) {
        if (p->ind + 1 >= p->max)
            p = NULL;
        else if (mprotect(p, pgsize, PROT_READ | PROT_WRITE))
            goto unlock;
    }
    if (p == NULL) {
        p = mmap(NULL, pgsize, PROT_READ | PROT_WRITE,
                 MAP_ANON | MAP_PRIVATE, -1, 0);
        if (p == MAP_FAILED)
            goto unlock;
        if (__atexit == NULL) {
            memset(&p->fns[0], 0, sizeof(p->fns[0]));
            p->ind = 1;
        } else
            p->ind = 0;
        p->max = (pgsize - ((char *) &p->fns[0] - (char *) p)) /
                 sizeof(p->fns[0]);
        p->next = __atexit;
        __atexit = p;
        if (__atexit_invalid)
            __atexit_invalid = 0;
    }
    fnp = &p->fns[p->ind++];
    fnp->fn_ptr.cxa_func = func;
    fnp->fn_arg = arg;
    fnp->fn_dso = dso;
    if (mprotect(p, pgsize, PROT_READ))
        goto unlock;
    ret = 0;
    unlock:
    _ATEXIT_UNLOCK();
    return (ret);
}

/*
 * Call all handlers registered with __cxa_atexit() for the shared
 * object owning 'dso'.
 * Note: if 'dso' is NULL, then all remaining handlers are called.
 */
void __cxa_finalize(void *dso) {
    struct atexit *p, *q;
    struct atexit_fn fn;
    int n, pgsize = getpagesize();
    static int call_depth;
    if (__atexit_invalid)
        return;
    _ATEXIT_LOCK();
    call_depth++;
    for (p = __atexit; p != NULL; p = p->next) {
        for (n = p->ind; --n >= 0;) {
            if (p->fns[n].fn_ptr.cxa_func == NULL)
                continue;    /* already called */
            if (dso != NULL && dso != p->fns[n].fn_dso)
                continue;    /* wrong DSO */
            /*
             * Mark handler as having been already called to avoid
             * dupes and loops, then call the appropriate function.
             */
            fn = p->fns[n];
            if (mprotect(p, pgsize, PROT_READ | PROT_WRITE) == 0) {
                p->fns[n].fn_ptr.cxa_func = NULL;
                mprotect(p, pgsize, PROT_READ);
            }
            _ATEXIT_UNLOCK();
#if ANDROID
            /* it looks like we should always call the function
                         * with an argument, even if dso is not NULL. Otherwise
                         * static destructors will not be called properly on
                         * the ARM.
                         */
            (*fn.fn_ptr.cxa_func)(fn.fn_arg);
#else /* !ANDROID */
            if (dso != NULL)
                (*fn.fn_ptr.cxa_func)(fn.fn_arg);
            else
                (*fn.fn_ptr.std_func)();
#endif /* !ANDROID */
            _ATEXIT_LOCK();
        }
    }
    /*
     * If called via exit(), unmap the pages since we have now run
     * all the handlers.  We defer this until calldepth == 0 so that
     * we don't unmap things prematurely if called recursively.
     */
    if (dso == NULL && --call_depth == 0) {
        for (p = __atexit; p != NULL;) {
            q = p;
            p = p->next;
            munmap(q, pgsize);
        }
        __atexit = NULL;
    }
    _ATEXIT_UNLOCK();
}