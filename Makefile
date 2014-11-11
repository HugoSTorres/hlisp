# compiler
CC=clang

# source directories
SOURCEDIR=./src
SOURCES=$(wildcard src/*.c)

# header directories
INCLUDEDIR=./include
INCLUDE=$(wildcard include/*.h)

# compiler flags
CFLAGS=-I$(INCLUDEDIR)
CFLAGSDEBUG=$(CFLAGS) -DDEBUG

# default is the target that runs when a target isn't explicitly named
default:
	$(CC) $(CFLAGS) $(SOURCES) -o hlisp

debug:
	$(CC) $(CFLAGSDEBUG) $(SOURCES) -o hlisp-debug

# phony prevents make from checking for files named clean
.PHONY: clean dclean
clean: hlisp
	rm hlisp

clean-debug: hlisp-debug
	rm hlisp-debug