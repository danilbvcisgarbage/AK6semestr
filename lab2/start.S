.syntax unified
.cpu cortex-m4
.thumb

.global vtable
.global __hard_reset__

.type vtable, %object
.type __hard_reset__, %function

vtable:
    .word   __stack_start       /* Stack pointer */
    .word   __hard_reset__+1    /* Reset handler */

.size vtable, .-vtable

__hard_reset__:
    bl      lab2                /* Execute lab2 */
end:
    b       end                 /* Infinite loop */

.size __hard_reset__, .-__hard_reset__
