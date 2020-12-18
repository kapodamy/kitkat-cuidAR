#include <sys/cdefs.h>

struct atexit {
    struct atexit *next;		/* next in list */
    int ind;			/* next index in this table */
    int max;			/* max entries >= ATEXIT_SIZE */
    struct atexit_fn {
        union {
            void (*std_func)(void);
            void (*cxa_func)(void *);
        } fn_ptr;
        void *fn_arg;		/* argument for CXA callback */
        void *fn_dso;		/* shared module handle */
    } fns[1];			/* the table itself */
};
__BEGIN_DECLS
int __isthreaded;
extern int __atexit_invalid;
extern struct atexit *__atexit;		/* points to head of LIFO stack */
int	__cxa_atexit(void (*)(void *), void *, void *);
void	__cxa_finalize(void *);
__END_DECLS