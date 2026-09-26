# herdr local install
#
# `make install` builds the release binary and installs it locally so the
# checked-out version becomes the herdr on your PATH.

PREFIX ?= $(HOME)/.local
CARGO_TARGET_DIR ?= target
BIN := $(CARGO_TARGET_DIR)/release/herdr

.PHONY: install uninstall

install:
	cargo build --release --locked
	install -d "$(DESTDIR)$(PREFIX)/bin"
	install -m 755 "$(BIN)" "$(DESTDIR)$(PREFIX)/bin/herdr"
	@echo "installed herdr to $(DESTDIR)$(PREFIX)/bin/herdr"

uninstall:
	rm -f "$(DESTDIR)$(PREFIX)/bin/herdr"
	@echo "removed herdr from $(DESTDIR)$(PREFIX)/bin"
