AC_PREREQ(2.59)

AC_INIT([osf-doc], esyscmd([echo -n `date '+%Y%m%d'`]), [http://osf.berlios.de/])
AC_CONFIG_AUX_DIR([config])
AM_INIT_AUTOMAKE

AM_MAINTAINER_MODE

AC_CHECK_PROGS(XSLTPROC, xsltproc)
AC_CHECK_PROGS(JADE, [openjade jade])
AC_CHECK_PROGS(JADETEX, [jadetex])
AC_CHECK_PROGS(PDFJADETEX, [pdfjadetex])

AC_CONFIG_FILES([
        Makefile
])

AC_OUTPUT
