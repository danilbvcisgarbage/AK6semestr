MEMORY
{
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 1M
    SRAM (rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS
{
    .text :
    {
        KEEP(*(.vectors))   /* Interrupt vector table */
        *(.text*)           /* Program instructions */
        *(.rodata*)         /* Read-only data */
    } > FLASH

    .data :
    {
        *(.data*)           /* Initialized variables */
    } > SRAM AT > FLASH

    .bss :
    {
        *(.bss*)            /* Zero-initialized variables */
    } > SRAM

    __stack_start = ORIGIN(SRAM) + LENGTH(SRAM); /* Stack at SRAM end */
}
