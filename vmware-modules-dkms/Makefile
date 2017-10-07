#!/usr/bin/make -f

MODULES = \
	vmblock \
	vmci \
	vmmon \
	vmnet \
	vsock

TARDIR = /usr/lib/vmware/modules/source

KVERSION = $(shell uname -r)

all: $(foreach m, $(MODULES), $m.ko)

%.ko: % $(TARDIR)/%.tar
	$(MAKE) KVERSION=$(KVERSION) VM_KBUILD=yes MODULEBUILDDIR=$(MODULEBUILDDIR) -C $*
	mv $*.o $*.ko

$(MODULES): %: $(TARDIR)/%.tar
	tar xf $<
	mv $*-only $*
	chmod -R +w $*
	if [ -e $*.patch ] ; then \
		patch -p1 < $*.patch ; \
	fi;

vsock.ko: vmci.ko

clean:
	rm -rf $(MODULES)
	rm -rf $(foreach m, $(MODULES), $m-only)
	rm -f  $(foreach m, $(MODULES), $m.ko)
	rm -f  $(foreach m, $(MODULES), $m.o)
