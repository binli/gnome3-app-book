## Process this file with automake to produce Makefile.in

## Created by Anjuta



AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(localedir)"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DPACKAGE_DATA_DIR=\""$(pkgdatadir)"\" \
	$(HELLO_VALA_CFLAGS)

AM_CFLAGS =\
	 -Wall\
	 -g

bin_PROGRAMS = hello_vala

hello_vala_SOURCES = \
	hello_vala.vala config.vapi book.vala

hello_vala_VALAFLAGS =  \
	--pkg gtk+-3.0


hello_vala_LDFLAGS = \
	-Wl,--export-dynamic

hello_vala_LDADD = $(HELLO_VALA_LIBS)




