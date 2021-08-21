objs := BCDCounter_mod6.vcd BCDCounter_mod10.vcd

all: $(objs)

$(objs): %.vcd: %.v %.tb.v $(OUT)/
	iverilog $^ -o foo
	vvp foo
	rm foo
	mv $(@D)/$(@F) $(OUT)/$(@F)