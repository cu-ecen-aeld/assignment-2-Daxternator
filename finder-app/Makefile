CC=gcc
CFLAGS=-Wall
TARGET=writer

# Check if CROSS_COMPILE is set, otherwise use default gcc
ifdef CROSS_COMPILE
    CC=$(CROSS_COMPILE)gcc
endif

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

clean:
	rm -f $(TARGET) *.o

.PHONY: all clean

