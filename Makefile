# Automatically generated by /home/rosen/perso/remote-audio/buildroot/support/scripts/mkmakefile: don't edit

lastword = $(word $(words $(1)),$(1))
makedir := $(dir $(call lastword,$(MAKEFILE_LIST)))

MAKEARGS := -C /home/rosen/perso/remote-audio/buildroot
MAKEARGS += O=$(if $(patsubst /%,,$(makedir)),$(CURDIR)/)$(patsubst %/,%,$(makedir))

MAKEFLAGS += --no-print-directory

.PHONY: all $(MAKECMDGOALS)

all	:= $(filter-out all Makefile,$(MAKECMDGOALS))

all:
	$(MAKE) $(MAKEARGS) $(all)

Makefile:;

$(all): all
	@:

%/: all
	@:
