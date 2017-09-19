# Makefile for Synapse
#
# Compiler: FreePascal

#For now, I don't think we need to have different directories for each Synapse version...
#SYNAPSE_VER="40"
LAZARUS_VER=`ls /usr/lib/lazarus/|head -1`

all: 
	fpc -MObjFPC -Scgi -O1 -gl -vewnhi -l -Fi/tmp/ -Fu -Fu/usr/lib/lazarus/$(LAZARUS_VER)/lcl/units/i386-linux/ -Fu/usr/lib/lazarus/$(LAZARUS_VER)/lcl/units/i386-linux/gtk2/ -Fu/usr/lib/lazarus/$(LAZARUS_VER)/packager/units/i386-linux/ -Fu. -FU. -dLCL -dLCLgtk2 laz_synapse.pas

clean:
	rm -f *o *ppu

install:
	mkdir -p $(DESTDIR)/usr/lib/synapse/$(SYNAPSE_VER) && cp *o $(DESTDIR)/usr/lib/synapse/$(SYNAPSE_VER)/. && cp *ppu $(DESTDIR)/usr/lib/synapse/$(SYNAPSE_VER)/.
