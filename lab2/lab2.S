.global lab2
.syntax unified
.cpu cortex-m4
.thumb

lab2:
    push   {lr}             // Store link register

    // Initialize inputs
    mov    r1, #3           // r1 = a
    mov    r2, #2           // r2 = b
    mov    r3, #5           // r3 = c

    // Compute product a * b
    mul    r4, r1, r2       // r4 = a * b

    // Check condition
    cmp    r4, #10
    blt    path_mult        // Branch if a * b < 10

    // Case a * b >= 10: compute (a | b) * c
    orr    r5, r1, r2       // r5 = a | b
    mul    r6, r5, r3       // r6 = (a | b) * c
    b      result           // Jump to end

path_mult:
    // Case a * b < 10: compute (a * b) * c
    mul    r6, r4, r3       // r6 = (a * b) * c

result:
    // Output in r6
    pop    {pc}             // Return
