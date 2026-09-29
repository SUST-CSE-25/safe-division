# Makefile for Safe Division
#
#   make build                   compile solution.c
#   make build REG=2019331002    compile 2019331002_solution.c
#   make run   [REG=...]         run the program, you type the input
#   make test  [REG=...]         run the program on every test in tests/
#   make clean                   delete the build folder

CC     = gcc
CFLAGS = -std=c11 -Wall -Wextra

# Windows programs end in .exe
ifeq ($(OS),Windows_NT)
  EXE = .exe
endif

# Which file do we build? solution.c, or <REG>_solution.c if REG is given.
ifeq ($(strip $(REG)),)
  SRC  = solution.c
  PROG = build/solution$(EXE)
else
  SRC  = $(REG)_solution.c
  PROG = build/$(REG)_solution$(EXE)
endif

.PHONY: build run test clean

build: $(PROG)

$(PROG): $(SRC)
	@mkdir -p build
	$(CC) $(CFLAGS) $< -o $@

run: $(PROG)
	./$(PROG)

test: $(PROG)
	@bash tests/run.sh ./$(PROG)

clean:
	rm -rf build
