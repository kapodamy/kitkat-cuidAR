#include <pthread.h>
#include <cerrno>
#include <cstring>
#include "locale-impl.h"

static pthread_key_t g_uselocale_key;
static bool current_locale_is_utf8 = true;
static int g_locale_once = 0;
static lconv g_locale;


struct locale {
    size_t mb_cur_max;

    explicit locale(size_t mb_cur_max) : mb_cur_max(mb_cur_max) {
    }

    explicit locale(const locale *other) {
        if (other->mb_cur_max < 0) {
            mb_cur_max = current_locale_is_utf8 ? 4 : 1;
        } else {
            mb_cur_max = other->mb_cur_max;
        }
    }
};

__attribute__((constructor)) static void tls_uselocale_key_init() {
    pthread_key_create(&g_uselocale_key, nullptr);
}

static void __locale_init() {
    g_locale.decimal_point = const_cast<char *>(".");
    char *not_available = const_cast<char *>("");
    g_locale.thousands_sep = not_available;
    g_locale.grouping = not_available;
    g_locale.int_curr_symbol = not_available;
    g_locale.currency_symbol = not_available;
    g_locale.mon_decimal_point = not_available;
    g_locale.mon_thousands_sep = not_available;
    g_locale.mon_grouping = not_available;
    g_locale.positive_sign = not_available;
    g_locale.negative_sign = not_available;
    g_locale.int_frac_digits = CHAR_MAX;
    g_locale.frac_digits = CHAR_MAX;
    g_locale.p_cs_precedes = CHAR_MAX;
    g_locale.p_sep_by_space = CHAR_MAX;
    g_locale.n_cs_precedes = CHAR_MAX;
    g_locale.n_sep_by_space = CHAR_MAX;
    g_locale.p_sign_posn = CHAR_MAX;
    g_locale.n_sign_posn = CHAR_MAX;
    g_locale.int_p_cs_precedes = CHAR_MAX;
    g_locale.int_p_sep_by_space = CHAR_MAX;
    g_locale.int_n_cs_precedes = CHAR_MAX;
    g_locale.int_n_sep_by_space = CHAR_MAX;
    g_locale.int_p_sign_posn = CHAR_MAX;
    g_locale.int_n_sign_posn = CHAR_MAX;
}

static bool __is_supported_locale(const char *locale) {
    return (strcmp(locale, "") == 0 ||
            strcmp(locale, "C") == 0 ||
            strcmp(locale, "C.UTF-8") == 0 ||
            strcmp(locale, "en_US.UTF-8") == 0 ||
            strcmp(locale, "POSIX") == 0);
}


char *setlocale(int category, const char *locale_name) {
    // Is 'category' valid?
    if (category < LC_CTYPE || category > LC_IDENTIFICATION) {
        errno = EINVAL;
        return nullptr;
    }
    // Caller wants to set the locale rather than just query?
    if (locale_name != nullptr) {
        if (!__is_supported_locale(locale_name)) {
            // We don't support this locale.
            errno = ENOENT;
            return nullptr;
        }
        current_locale_is_utf8 = (strstr(locale_name, "UTF-8") != nullptr);
    }
    return const_cast<char *>(current_locale_is_utf8 ? "C.UTF-8" : "C");
}

locale_k uselocale(locale_k new_locale) {
    auto old_locale = static_cast<locale_k>(pthread_getspecific(g_uselocale_key));
    if (old_locale == nullptr) {
        old_locale = LC_GLOBAL_LOCALE;
    }
    if (new_locale != nullptr) {
        pthread_setspecific(g_uselocale_key, new_locale);
    }
    return old_locale;
}

locale_k newlocale(int category_mask, const char *locale_name, locale_k /*base*/) {
    if ((category_mask & ~LC_ALL_MASK) != 0) {
        errno = EINVAL;
        return nullptr;
    }
    if (!__is_supported_locale(locale_name)) {
        errno = ENOENT;
        return nullptr;
    }
    return new locale(strstr(locale_name, "UTF-8") != nullptr ? 4 : 1);
}

struct lconv *localeconv() {
    pthread_once(&g_locale_once, __locale_init);
    return &g_locale;
}

void freelocale(locale_k locobj) {
    delete locobj;
}

size_t __ctype_get_mb_cur_max() {
    auto l = reinterpret_cast<locale_k>(pthread_getspecific(g_uselocale_key));
    if (l == nullptr || l == LC_GLOBAL_LOCALE) {
        return current_locale_is_utf8 ? 4 : 1;
    } else {
        return l->mb_cur_max;
    }
}

