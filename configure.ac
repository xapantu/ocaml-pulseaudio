# check for one particular file of the sources 
AC_CONFIG_MACRO_DIR([m4])
AC_INIT([ocaml-pulseaudio],[0.1.3],[savonet-users@lists.sourceforge.net])

VERSION=$PACKAGE_VERSION
AC_MSG_RESULT([configuring $PACKAGE_STRING])
AC_BASE_CHECKS()
PKG_PROG_PKG_CONFIG()
PKG_CONFIG_CHECK_MODULE([libpulse])
PKG_CONFIG_CHECK_MODULE([libpulse-simple])

# substitutions to perform
AC_SUBST(VERSION)
AC_SUBST(INC)
AC_SUBST(requires)

# Finally create the Makefile and samples
AC_CONFIG_FILES([Makefile],[chmod a-w Makefile])
AC_CONFIG_FILES([src/META])
AC_CONFIG_FILES([src/Makefile])
AC_OUTPUT
