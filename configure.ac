#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.63])
AC_INIT(gorc, 0.0.1, faust.matthias@googlemail.com)

AM_INIT_AUTOMAKE(gorc, 0.0.1)

AC_CONFIG_SRCDIR([src/gorc.c])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h])

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.
AC_CHECK_FUNCS([atexit])

AC_CONFIG_FILES([Makefile
                 src/Makefile])

AC_OUTPUT
