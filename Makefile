APPNAME = shaodwarc
OUTDIR = build
INSTALLDIR = /usr/local/bin

compile:
	@mkdir -p $(OUTDIR)
	@cmake -B$(OUTDIR) -S.
	@cmake --build $(OUTDIR)

clean:
	@rm -r $(OUTDIR)