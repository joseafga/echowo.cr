.PHONY: all debug install uninstall
PREFIX ?= /usr

all:
				crystal build --release src/echowo.cr -o bin/echowo

debug:
				crystal build --debug src/echowo.cr -o bin/echowo

install:
				install -D -m0755 bin/echowo $(DESTDIR)$(PREFIX)/bin/echowo
				install -D -m0644 LICENSE $(DESTDIR)$(PREFIX)/share/licenses/echowo/LICENSE

uninstall:
				rm $(DESTDIR)$(PREFIX)/bin/echowo
				rm $(DESTDIR)$(PREFIX)/share/licenses/echowo/LICENSE
				rmdir $(DESTDIR)$(PREFIX)/share/licenses/echowo
