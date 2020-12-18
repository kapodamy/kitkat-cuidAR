#include <cstdint>
#include <sys/auxv.h>

extern uintptr_t __stack_chk_guard = 0;

static void __attribute__((constructor)) __init_stack_check_guard() {
    // AT_RANDOM is a pointer to 16 bytes of randomness on the stack.
    __stack_chk_guard = *reinterpret_cast<uintptr_t*>(getauxval(AT_RANDOM));
}
