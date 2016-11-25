AC_DEFUN([AC_CHECK_OCAML_COMPILERS],[
OCAMLFIND_LDCONF=""
AC_ARG_ENABLE([ldconf], AC_HELP_STRING([--disable-ldconf],[don't modify the dynamic loader configuration file (default is enable)]),[ac_enable_ldconf=$enableval],[ac_enable_ldconf=$enableval],[ac_enable_ldconf=yes])
if test "$ac_enable_ldconf" = no ; then
	AC_MSG_RESULT([disabling modification of ld.conf])
	OCAMLFIND_LDCONF=dummy
fi
AC_SUBST(OCAMLFIND_LDCONF)

# Check for Ocaml compilers

AC_PROG_OCAML()

AC_PROG_CAMLIDL()

AC_PROG_OCAMLLEX()

AC_PROG_OCAMLYACC()

AC_PROG_CAMLP4()

AC_PROG_FINDLIB()

AC_CHECK_OCAML_STDLIB()

# Check if caml/threads.h is present 
AC_CHECK_HEADER([caml/threads.h],[CAML_THREADS=yes],[],[#include <caml/misc.h>])

AC_ARG_ENABLE([debugging],
   AC_HELP_STRING(
      [--disable-debugging],
      [disable debugging information (backtrace printing in particular)]))

if test "$enable_debugging" \!= "no" ; then
  OCAMLFLAGS="$OCAMLFLAGS -g"
fi

AC_ARG_WITH([ocaml-warnings],
   AC_HELP_STRING(
      [--with-ocaml-warnings=WARNINGS],
      [Enable specific list of ocaml compiler warnings.]))

if test -n "${with_ocaml_warnings}" ; then
  OCAMLFLAGS="$OCAMLFLAGS -w +${with_ocaml_warnings}"
else
  OCAMLFLAGS="$OCAMLFLAGS -w +A@5-7@8@11@12@20-35-44-45"
fi

AC_ARG_ENABLE([profiling],
   AC_HELP_STRING(
      [--enable-profiling],
      [compile to generate profiling infomation]))
if test "x$enable_profiling" = "xyes" ; then
  OCAMLNCFLAGS="$OCAMLNCFLAGS -p"
fi
AC_SUBST(OCAMLNCFLAGS)

AC_ARG_ENABLE([nativecode],
   AC_HELP_STRING(
      [--disable-nativecode],
      [compile in bytecode]))

AC_ARG_ENABLE([custom],
   AC_HELP_STRING(
      [--disable-custom],
      [disable custom mode for bytecode compilation (use if you know what you are doing)]))

CAMLLIBPATH=$OCAMLLIB
AC_SUBST(CAMLLIBPATH)

AC_SUBST(CAMLIDL)
AC_SUBST(OCAMLFLAGS)
])
