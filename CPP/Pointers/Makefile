CC = g++
CFLAGS =
COPTFLAGS = -O3 -g
LDFLAGS =

default:
	@echo "=================================================="
	@echo "To build your sorting code, use:"
	@echo "  make quick-sort           # For Quick sort"
	@echo ""
	@echo "To clean this subdirectory (remove object files"
	@echo "and other junk), use:"
	@echo "  make clean"
	@echo "=================================================="

# Quick sort driver 
arrayops: driver.o arrayops.o
	$(CC) $(COPTFLAGS) -o $@ $^

%.o: src/%.cc
	$(CC) $(CFLAGS) $(COPTFLAGS) -o $@ -c $<

clean:
	rm -f core *.o *~ arrayops 

# eof
