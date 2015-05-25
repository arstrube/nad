CXX = g++
CC  = gcc
AR = ar
CXXFLAGS = -g3 -Wextra -Wall -Werror -O0 -I/usr/local/include
CFLAGS = -std=c99 $(CXXFLAGS)
LIBS= -lCppUTest -lCppUTestExt
LIB_PATH=-L. -L/usr/local/lib

.PHONY: all clean i

all: i nad.exe

tdd: i nad_test.exe

%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) $< -o $@

%.o: %.i
	$(CC) -c $(CFLAGS) $< -o $@
    
%.i: %.c
	$(CC) -E $(CFLAGS) $< -o $@
    
nad.exe: nad.o nad_main.o
	$(CXX) $(CFLAGS) $(LIB_PATH) $? $(LIBS) -o $@

nad_test.exe: nad.o nad_test_main.o
	$(CXX) $(CFLAGS) $(LIB_PATH) $? $(LIBS) -o $@
	./$@ -v -c

nad.o nad_main.o: Makefile

clean:
	rm -rf *.a *.dSYM *.exe *.i *.o
