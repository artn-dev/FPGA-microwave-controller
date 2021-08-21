objs := Timer.vcd

all: $(objs)

$(objs): %.vcd: %.v %.tb.v $(OUT)/
	iverilog $^ -o foo -I $(CURDIR)/nivel3
	vvp foo
	rm foo
	mv $(@D)/$(@F) $(OUT)/$(@F)