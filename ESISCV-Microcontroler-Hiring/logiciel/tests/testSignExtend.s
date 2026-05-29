addi a0, zero, -1

addi a0, zero, 1

lw a2, -2(sp)

lw a2, 2(sp)

sw a2, -4(sp)

sw a2, 4(sp)

beq a1, a0, -8

beq a1, a0, 8

bne a1, a0, -12

bne a1, a0, 12

blt a1, a0, -16

blt a1, a0, 16

bge a1, a0, -20

bge a1, a0, 20

jal a0, -24

jal a0, 24