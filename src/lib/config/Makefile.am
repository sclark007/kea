SUBDIRS = . tests

AM_CPPFLAGS = -I$(top_srcdir)/src/lib -I$(top_builddir)/src/lib
AM_CPPFLAGS += $(BOOST_INCLUDES)

# Define rule to build logging source files from message file
config_messages.h config_messages.cc: s-messages

s-messages: config_messages.mes
	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/config/config_messages.mes
	touch $@

BUILT_SOURCES = config_messages.h config_messages.cc

lib_LTLIBRARIES = libkea-cfgclient.la
libkea_cfgclient_la_SOURCES = config_data.h config_data.cc
libkea_cfgclient_la_SOURCES += cmds_impl.h
libkea_cfgclient_la_SOURCES += module_spec.h module_spec.cc
libkea_cfgclient_la_SOURCES += base_command_mgr.cc base_command_mgr.h
libkea_cfgclient_la_SOURCES += client_connection.cc client_connection.h
libkea_cfgclient_la_SOURCES += command_mgr.cc command_mgr.h
libkea_cfgclient_la_SOURCES += config_log.h config_log.cc
libkea_cfgclient_la_SOURCES += hooked_command_mgr.cc hooked_command_mgr.h

libkea_cfgclient_la_LIBADD = $(top_builddir)/src/lib/dhcp/libkea-dhcp++.la
libkea_cfgclient_la_LIBADD += $(top_builddir)/src/lib/asiolink/libkea-asiolink.la
libkea_cfgclient_la_LIBADD += $(top_builddir)/src/lib/cc/libkea-cc.la
libkea_cfgclient_la_LIBADD += $(top_builddir)/src/lib/dns/libkea-dns++.la
libkea_cfgclient_la_LIBADD += $(top_builddir)/src/lib/cryptolink/libkea-cryptolink.la
libkea_cfgclient_la_LIBADD += $(top_builddir)/src/lib/hooks/libkea-hooks.la
libkea_cfgclient_la_LIBADD += $(top_builddir)/src/lib/log/libkea-log.la
libkea_cfgclient_la_LIBADD += $(top_builddir)/src/lib/util/threads/libkea-threads.la
libkea_cfgclient_la_LIBADD += $(top_builddir)/src/lib/util/libkea-util.la
libkea_cfgclient_la_LIBADD += $(top_builddir)/src/lib/exceptions/libkea-exceptions.la
libkea_cfgclient_la_LIBADD += $(LOG4CPLUS_LIBS) $(CRYPTO_LIBS) $(BOOST_LIBS)

libkea_cfgclient_la_LDFLAGS = -no-undefined -version-info 4:0:0
libkea_cfgclient_la_LDFLAGS += $(CRYPTO_LDFLAGS)

nodist_libkea_cfgclient_la_SOURCES  = config_messages.h config_messages.cc

# The message file should be in the distribution.
EXTRA_DIST = config_messages.mes command-socket.dox

CLEANFILES = *.gcno *.gcda config_messages.h config_messages.cc s-messages

# Specify the headers for copying into the installation directory tree.
libkea_cfgclient_includedir = $(pkgincludedir)/config
libkea_cfgclient_include_HEADERS = \
	base_command_mgr.h \
	client_connection.h \
	cmds_impl.h \
	command_mgr.h \
	config_data.h \
	config_log.h \
	hooked_command_mgr.h \
	module_spec.h


