AC_PREREQ(2.59)

AC_INIT([osf-web], esyscmd([echo -n `date '+%Y%m%d'`]), [http://osf.berlios.de/])
AC_CONFIG_AUX_DIR([config])
AM_INIT_AUTOMAKE

AM_MAINTAINER_MODE

AC_PATH_PROG([PERL], perl, no)
if test "$PERL" = no; then
  AC_MSG_ERROR([perl is not found])
fi

AC_CONFIG_FILES([
	Makefile
	htdocs/Makefile
	htdocs/templates/Makefile
	lib/OSF/Makefile
	lib/Makefile
	bin/Makefile
])

AC_OUTPUT
