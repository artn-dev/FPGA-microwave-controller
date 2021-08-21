.SUFFIXES: .v .tb.v .vcd
VPATH = nivel3

OUT := $(CURDIR)/build

include */*.mk

$(OUT)/:
	mkdir -p $@

.PHONY: clean
clean: $(OUT)/
	rm -rf $(OUT)