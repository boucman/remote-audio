################################################################################
#
# xlib_libX11 -- X.Org X11 library
#
################################################################################

XLIB_LIBX11_VERSION = 1.4.2
XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBX11_INSTALL_STAGING = YES
XLIB_LIBX11_DEPENDENCIES = \
	libxcb \
	xutil_util-macros \
	xlib_xtrans \
	xlib_libXau \
	xlib_libXdmcp \
	xproto_kbproto \
	xproto_xproto \
	xproto_xextproto \
	xproto_inputproto \
	xproto_xf86bigfontproto \
	host-xproto_xproto

XLIB_LIBX11_CONF_OPT = \
	--disable-malloc0returnsnull \
	--with-xcb \
	--disable-specs \
	--without-perl

HOST_XLIB_LIBX11_CONF_OPT = \
	--disable-specs \
	--without-perl

# src/util/makekeys is executed at build time to generate ks_tables.h, so
# it should get compiled for the host. The libX11 makefile unfortunately
# doesn't have X11_CFLAGS_FOR_BUILD so this doesn't work.  For buildroot,
# we know the X11 includes are in $(HOST_DIR)/usr/include, which are already
# in the CFLAGS_FOR_BUILD, so we can just remove the X11_CFLAGS
define XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
	$(SED) '/X11_CFLAGS/d' $(@D)/src/util/Makefile*
endef

XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS

$(eval $(autotools-package))
$(eval $(host-autotools-package))
