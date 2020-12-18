#include <elf.h>
#include <ctime>
#include <link.h>
#include <pthread.h>

#if __ANDROID_API__ < 21

#define COND_GET_CLOCK(c) (((c) & 0x0002) >> 1)

extern void *__executable_start;
Elf32_auxv_t* __libc_auxv = NULL;


typedef struct {
    int volatile value;
} pthread_cond_t_local;

unsigned long int getauxval(unsigned long int type) {
    for (Elf32_auxv_t* v = __libc_auxv; v->a_type != AT_NULL; ++v) {
        if (v->a_type == type) {
            return v->a_un.a_val;
        }
    }
    return 0;
}

// Initialize 'ts' with the difference between 'abstime' and the current time
// according to 'clock'. Returns -1 if abstime already expired, or 0 otherwise.
int __timespec_from_absolute(timespec* ts, const timespec* abstime, clockid_t clock) {
    clock_gettime(clock, ts);
    ts->tv_sec  = abstime->tv_sec - ts->tv_sec;
    ts->tv_nsec = abstime->tv_nsec - ts->tv_nsec;
    if (ts->tv_nsec < 0) {
        ts->tv_sec--;
        ts->tv_nsec += 1000000000;
    }
    if ((ts->tv_nsec < 0) || (ts->tv_sec < 0)) {
        return -1;
    }
    return 0;
}


extern "C" int dl_iterate_phdr(int (*cb)(struct dl_phdr_info *info, size_t size, void *data), void *data) {
    Elf32_Ehdr *ehdr = (Elf32_Ehdr *) &__executable_start;
    // TODO: again, copied from linker.c. Find a better home for this later.
    if (ehdr->e_ident[EI_MAG0] != ELFMAG0) return -1;
    if (ehdr->e_ident[EI_MAG1] != ELFMAG1) return -1;
    if (ehdr->e_ident[EI_MAG2] != ELFMAG2) return -1;
    if (ehdr->e_ident[EI_MAG3] != ELFMAG3) return -1;
    // Dynamic binaries get their dl_iterate_phdr from the dynamic linker, but
    // static binaries get this. We don't have a list of shared objects to
    // iterate over, since there's really only a single monolithic blob of
    // code/data, plus optionally a VDSO.
    struct dl_phdr_info exe_info;
    exe_info.dlpi_addr = 0;
    exe_info.dlpi_name = NULL;
    exe_info.dlpi_phdr = reinterpret_cast<ElfW(Phdr)*>(reinterpret_cast<uintptr_t>(ehdr) + ehdr->e_phoff);
    exe_info.dlpi_phnum = ehdr->e_phnum;

#if defined(AT_SYSINFO_EHDR)
    // Try the executable first.
    int rc = cb(&exe_info, sizeof(exe_info), data);
    if (rc != 0) {
        return rc;
    }
    // Try the VDSO if that didn't work.
    ElfW(Ehdr)* ehdr_vdso = reinterpret_cast<ElfW(Ehdr)*>(getauxval(AT_SYSINFO_EHDR));
    struct dl_phdr_info vdso_info;
    vdso_info.dlpi_addr = 0;
    vdso_info.dlpi_name = NULL;
    vdso_info.dlpi_phdr = reinterpret_cast<ElfW(Phdr)*>(reinterpret_cast<char*>(ehdr_vdso) + ehdr_vdso->e_phoff);
    vdso_info.dlpi_phnum = ehdr_vdso->e_phnum;
    for (size_t i = 0; i < vdso_info.dlpi_phnum; ++i) {
        if (vdso_info.dlpi_phdr[i].p_type == PT_LOAD) {
            vdso_info.dlpi_addr = (ElfW(Addr)) ehdr_vdso - vdso_info.dlpi_phdr[i].p_vaddr;
            break;
        }
    }
    return cb(&vdso_info, sizeof(vdso_info), data);
#else
    return cb(&exe_info, sizeof(exe_info), data);
#endif
}

extern "C" int pthread_cond_timedwait(pthread_cond_t *cond, pthread_mutex_t *mutex, const struct timespec *abstime) {
    timespec ts;
    timespec* tsp;
    auto cond_local = (pthread_cond_t_local*)cond;

    if (abstime != NULL) {
        if (__timespec_from_absolute(&ts, abstime, COND_GET_CLOCK(cond_local->value)) < 0) {
            return ETIMEDOUT;
        }
        tsp = &ts;
    } else {
        tsp = NULL;
    }
    return pthread_cond_timedwait_relative_np(cond, mutex, tsp);
}

#endif