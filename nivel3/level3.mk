objs := BCDCounter_mod6.vcd BCDCounter_mod10.vcd

all: $(objs)

$(objs): %.vcd: %.v %.tb.v
	iverilog $^ -o foo
	vvp foo
	rm foo

.PHONY: clean
clean:
	rm $(objs)