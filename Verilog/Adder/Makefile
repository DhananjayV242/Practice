# Need to update the target dependencies

CC=vlog
RR=vsim
CFILE=file.f
CCFLAGS=-sv -f $(CFILE)
FLAGS+= +incdir+env +define+NO_RAND

# objects:= $(wildcard dut/*)
# objects+= $()
default:
	$(CC) $(CCFLAGS) $(FLAGS) 

run:
	$(RR) -c tb

clean:
	rm -rf work
