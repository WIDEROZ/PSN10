# Initialise stack pointer
li sp, 64

# All 13 instructions supported in the project.

addi    a0, zero, 4
add     t1, a0, a0
beq     t1, a0, 4
bne     a0, a0, 4
blt     a0, a0, 4
bge     a0, t1, 4
jal     ra, 4
j       4
li      a1, 17
mv      a2, a1
sub     a1, a1, t1
sw      a2, -4(sp)
lw      a3, -4(sp)

# EXPECTED
# ra (x1): 32
# sp (x2): 64
# t1 (x6): 8
# a0 (x10): 4
# a1 (x11): 9
# a2 (x12): 17
# a3 (x13): 17
