# Compute the sum of the first N integers

# Equivalent C code:
#   int sum=0;
#   for (int i=1; i<10; i++){
#       sum+=i;
#   }
#   int *peripheral_adress=256;
#   *peripheral_adress=sum;

addi t0, zero, 10   # Maximum value for i

li t1, 1            # i=1;

li t2, 0            # sum=0;

bge t1, t0, 16      # End loop if (i < 10)

add t2, t2, t1      # sum+=i;

addi t1, t1, 1      # i++;

j -12               # Jump back (for the loop)

li t0, 256          # peripheral_address=256;

sw t2, 0(t0)        # *peripheral_address=sum;

# EXPECTED
# t0 (x5): 256
# t1 (x6): 10
# t2 (x7): 45