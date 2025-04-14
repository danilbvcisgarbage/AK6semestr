# Tools
AS      = arm-none-eabi-as
LD      = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
GDB     = arm-none-eabi-gdb

# Flags
CFLAGS  = -mcpu=cortex-m4 -mthumb -g
LDFLAGS = -nostdlib -T lscript.ld

# Files
SOURCES = start.S lab2.S
OBJECTS = $(SOURCES:.S=.o)
ELF     = firmware.elf
BIN     = firmware.bin

# Build target
all: $(BIN)

# Assemble
%.o: %.S
	$(AS) $(CFLAGS) -c $< -o $@

# Link
$(ELF): $(OBJECTS)
	$(LD) $(LDFLAGS) $^ -o $@

# Binary output
$(BIN): $(ELF)
	$(OBJCOPY) -O binary $< $@

# Clean
clean:
	rm -f $(OBJECTS) $(ELF) $(BIN)

# QEMU
qemu:
	qemu-system-arm -machine netduino2 -kernel $(BIN) -nographic -s -S &

# GDB
gdb:
	$(GDB) $(ELF)

.PHONY: all clean qemu gdb