.gba
.open "hack.gba", 0x08000000

FRAME_COUNTER equ 0x030014c8

.thumb
.org 0x08091eac
        ; before arcade
        bl      randomize_cpu_color
.org 0x0806b260
        ; between arcade matches
        bl      randomize_cpu_color

.org 0x0845c800
randomize_cpu_color:
        push    {r0, lr}
        ; replace original instruction
        bl      0x08091dbc
        pop     {r0}

        ; find random outfit
        ldr     r1, =FRAME_COUNTER
        ldrb    r1, [r1]
        mov     r2, #0x07
        and     r1, r2

        ; save outfit color
        sub     r3, #0x11
        add     r2, r0, r3
        strb    r1, [r2]
        pop     {pc}
.pool

.close
