AC_PREREQ(2.59)

AC_INIT([osf-base], esyscmd([echo -n `date '+%Y%m%d'`]), [osf-devel@lists.berlios.de])
AC_CONFIG_AUX_DIR([config])
AM_INIT_AUTOMAKE

AM_MAINTAINER_MODE

AC_PATH_PROG([PERL], perl, no)
if test "$PERL" = no; then
  AC_MSG_ERROR([perl is not found])
fi

AC_CONFIG_FILES([
	Makefile
	base-conf/Makefile
	conf-templates/Makefile
	bin/Makefile
])

AC_OUTPUT
