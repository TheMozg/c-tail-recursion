CC=gcc
CFLAGS=-ansi -pedantic -Wall -Werror -O2
SOURCES=main.c llist.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=app

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@
