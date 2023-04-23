APPNAME = shadowarc
INSTALLDIR = /usr/local/bin

compile:
	@nimble build -d:release --opt:speed --passL:-s --passL:-w --app:console

clean:
	@rm $(APPNAME)